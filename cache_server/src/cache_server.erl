%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Apr 2018 3:49 PM
%%%-------------------------------------------------------------------
-module(cache_server).
-behaviour(gen_server).
-author("irish_man").

%% API
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).


start_link(Args) ->
  ok.

insert(Key, Value, Ttl) ->
  ok.

lookup(Key) ->
  ok.

lookup_by_date(DateFrom, DateTo) ->
  ok.



init(Args) ->
  erlang:error(not_implemented).

handle_call(Request, From, State) ->
  erlang:error(not_implemented).

handle_cast(Request, State) ->
  erlang:error(not_implemented).

handle_info(Info, State) ->
  erlang:error(not_implemented).

terminate(Reason, State) ->
  erlang:error(not_implemented).

code_change(OldVsn, State, Extra) ->
  erlang:error(not_implemented).

%%{ok, Pid} = cache_server:start_link([{drop_interval, 3600}]).
%%ok = cache_server:insert(Key, Value, 600). %% Ключ, Значение, Время жизни записи
%%{ok, Value} = cache_server:lookup(Key).
%%DateFrom = {{2015,1,1},{00,00,00}}.
%%DateTo = {{2015,1,10},{23,59,59}}.
%%{ok, Value} = cache_server:lookup_by_date(DateFrom, DateTo).
%%Сервер должен хранить данные то количество времени которе было указано при записи. Интервал очистки устаревших данных указывается при старте (​drop_interval)​. Время задается в секундах.