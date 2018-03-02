%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(p01).
-author("irish_man").

%% API
-export([last/1]).

last([_]=L) ->
  L;
last([_|T]) ->
  last(T).