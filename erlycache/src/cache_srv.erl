%%%-------------------------------------------------------------------
%%% @author vshev4enko
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Apr 2018 12:05
%%%-------------------------------------------------------------------
-module(cache_srv).
-include_lib("stdlib/include/ms_transform.hrl").
-behaviour(gen_server).
-author("vshev4enko").


%% API
-export([
  start_link/1,
  insert/3,
  lookup/1,
  lookup_by_date/2,
  stop/0,
  handle_call/3,
  handle_cast/2]).
-export([
  init/1,
  handle_info/2,
  terminate/2,
  code_change/3]).

start_link(Args) ->
  TTL = proplists:get_value(drop_interval, Args),
  gen_server:start_link({local, ?MODULE}, ?MODULE, TTL, []).

stop() ->
  gen_server:stop(?MODULE).

init(TTL) ->
  Tab = ets:new(?MODULE, [named_table, public]),
  timer:send_interval(TTL * 1000, self(), drop_evaluate),
  {ok, {Tab, TTL}}.

insert(Key, Value, TTL) ->
  StartDate = calendar:universal_time(),
  DateSeconds = calendar:datetime_to_gregorian_seconds(StartDate),
  AllSeconds = DateSeconds + TTL,
  EndDate = calendar:gregorian_seconds_to_datetime(AllSeconds),
  ets:insert(?MODULE, {Key, Value, StartDate, EndDate}),
  ok.

lookup(Key) ->
  case ets:lookup(?MODULE, Key) of
    [{Key, Value, _, _}] ->
      {ok, Value};
    _ = Result ->
      Result
  end.

lookup_by_date(DateFrom, DateTo) ->
  MS = ets:fun2ms(fun({Key, Value, Date, _})
    when Date >= DateFrom andalso Date =< DateTo ->
    {Key, Value} end),
  Value = {ok, ets:select(?MODULE, MS)},
  {ok, Value}.

handle_info(drop_evaluate, State) ->
  FirstKey = ets:first(?MODULE),
  drop_evaluate(FirstKey),
  {noreply, State}.

terminate(Reason, State) ->
  {reply, Reason, State}.

code_change(_OldVsn, _State, _Extra) ->
  erlang:error(not_implemented).

drop_evaluate('$end_of_table') ->
  ok;
drop_evaluate(Key) ->
  Dt = calendar:universal_time(),
  [{_, _, _, EndDate}] = ets:lookup(?MODULE, Key),
  if
    Dt > EndDate ->
      Next = ets:next(?MODULE, Key),
      ets:delete(?MODULE, Key),
      drop_evaluate(Next);
    true ->
      Next = ets:next(?MODULE, Key),
      drop_evaluate(Next)
  end.

handle_call(_Request, _From, _State) ->
  erlang:error(not_implemented).

handle_cast(_Request, _State) ->
  erlang:error(not_implemented).