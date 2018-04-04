%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Apr 2018 4:09 PM
%%%-------------------------------------------------------------------
-module(basic_SUITE).
-include_lib("common_test/include/ct.hrl").
-author("irish_man").


-export([all/0, insert_to_ets/1, init_per_testcase/1]).

all() ->
  [
    insert_to_ets
  ].

init_per_testcase(insert_to_ets) ->
  cache_server:start_link([{drop_interval, 150}]),
  ct:sleep(5).

insert_to_ets(_Config) ->
  ok = cache_server:insert(test, 1234, 600).

