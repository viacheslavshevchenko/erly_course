%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Apr 2018 3:49 PM
%%%-------------------------------------------------------------------
-module(cache_server).
-include_lib("stdlib/include/ms_transform.hrl").
-behaviour(gen_server).
-author("irish_man").

%% API
-export([start_link/1, insert/3, lookup/1, lookup_by_date/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2]).


start_link(Args) ->
  TTL = proplists:get_value(drop_interval, Args),
  gen_server:start_link({local, ?MODULE}, ?MODULE, TTL, []).

insert(Key, Value, TTL) ->
  gen_server:call(?MODULE, {insert, Key, Value, TTL}).

lookup(Key) ->
  gen_server:call(?MODULE, {lookup, Key}).

lookup_by_date(DateFrom, DateTo) ->
  gen_server:call(?MODULE, {lookup_by_date, DateFrom, DateTo}).

init(TTL) ->
  Tab = ets:new(?MODULE, [named_table]),
  timer:send_interval(TTL*1000, self(), drop_evaluate),
  {ok, {Tab, TTL}}.

handle_call({insert, Key, Value, TTL}, _, State) ->
  StartDate = calendar:universal_time(),
  DateSeconds = calendar:datetime_to_gregorian_seconds(StartDate),
  AllSeconds = DateSeconds + TTL,
  EndDate = calendar:gregorian_seconds_to_datetime(AllSeconds),
  ets:insert(?MODULE, {Key, Value, StartDate, EndDate}),
  {reply, ok, State};
handle_call({lookup, Key}, _, State) ->
  case ets:lookup(?MODULE, Key) of
    [{Key, _, _, _} = Result] ->
      {reply, {ok, Result}, State};
    _ = Result ->
      {reply, {ok, Result}, State}
  end;
handle_call({lookup_by_date, DateFrom, DateTo}, _, State) ->
  MS = ets:fun2ms(fun({Key, Value, DateStart, DateEnd})
    when DateStart >= DateFrom andalso DateEnd =< DateTo ->
    {Key, Value} end),
  Reply = {ok, ets:select(?MODULE, MS)},
  {reply, Reply, State}.

handle_cast(_Arg0, _Arg1) ->
  erlang:error(not_implemented).

handle_info(drop_evaluate, State) ->
  FirstKey = ets:first(?MODULE),
  drop_evaluate(FirstKey),
  {noreply, State}.

drop_evaluate('$end_of_table') ->
  ok;
drop_evaluate(Key) ->
  Dt = calendar:universal_time(),
  [{_,_,_, EndDate}] = ets:lookup(?MODULE, Key),
  if
    Dt > EndDate ->
      Next = ets:next(?MODULE, Key),
      ets:delete(?MODULE, Key),
      drop_evaluate(Next);
    true ->
      Next = ets:next(?MODULE, Key),
      drop_evaluate(Next)
  end.


%%{ok, Pid} = cache_server:start_link([{drop_interval, 3600}]).
%%ok = cache_server:insert(Key, Value, 600). %% Ключ, Значение, Время жизни записи
%%{ok, Value} = cache_server:lookup(Key).
%%DateFrom = {{2015,1,1},{00,00,00}}.
%%DateTo = {{2015,1,10},{23,59,59}}.
%%{ok, Value} = cache_server:lookup_by_date(DateFrom, DateTo).
%%Сервер должен хранить данные то количество времени которе было указано при записи. Интервал очистки устаревших данных указывается при старте (​drop_interval)​. Время задается в секундах.


