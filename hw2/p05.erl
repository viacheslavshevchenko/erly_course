%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:20 AM
%%%-------------------------------------------------------------------
-module(p05).
-author("irish_man").

%% API
-export([reverse/1, tail_reverse/1]).

reverse([]) ->
  [];
reverse([H|T]) ->
  reverse(T)++[H].

tail_reverse(L) ->
  tail_reverse(L, []).

tail_reverse([], Acc) ->
  Acc;
tail_reverse([H|T], Acc) ->
  tail_reverse(T, [H|Acc]).