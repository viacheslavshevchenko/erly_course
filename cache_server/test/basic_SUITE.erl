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
-compile(export_all).

all() ->
  [
    plus,
    create_cache_server
  ].

init_per_testcase(_, _) ->
  ok.

end_per_testcase(_, _) ->
  ok.

create_cache_server(_) ->
  cache_server:start_link([{drop_interval, 600}]).

plus(_) ->
  2 = 2.


