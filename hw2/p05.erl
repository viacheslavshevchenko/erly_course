%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:20 AM
%%%-------------------------------------------------------------------
-module(p05).
-author("irishman").

%% API
-export([reverse/1]).


reverse(L) ->
  reverse(L, []).

reverse([], Acc) ->
  Acc;
reverse([H|T], Acc) ->
  reverse(T, [H|Acc]).