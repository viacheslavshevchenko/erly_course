%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Mar 2018 5:21 PM
%%%-------------------------------------------------------------------
-module(my_cache_tests).
-ifdef(TEST).
-author("irishman").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).


my_cache_create_test() ->
  ?assert(my_cache:create() =:= ok).

my_cache_insert_test() ->
  my_cache:create(),
  ?assert(my_cache:insert(test, 123, 60) =:= ok).

my_cache_lookup_test() ->
  my_cache:create(),
  my_cache:insert(test, 123, 60),
  ?assert(my_cache:lookup(test) =:= {ok, 123}).

my_cache_lookup_deprecated_test() ->
  my_cache:create(),
  my_cache:insert(test, 123, 0),
  timer:sleep(1000),
  ?assert(my_cache:lookup(test) =:= {error, value_is_deprecated}).

my_cache_delete_obsolete_test() ->
  my_cache:create(),
  my_cache:insert(test, 123, 0),
  my_cache:insert(test1, 123, 10),
  timer:sleep(1000),
  ?assert(my_cache:lookup(test) =:= {error, value_is_deprecated}),
  ?assert(my_cache:lookup(test1) =:= {ok, 123}),
  my_cache:delete_obsolete(),
  ?assert(my_cache:lookup(test) =:= []),
  ?assert(my_cache:lookup(test1) =:= {ok, 123}).

-endif.