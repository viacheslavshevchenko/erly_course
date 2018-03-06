%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:26 AM
%%%-------------------------------------------------------------------
-module(p03).
-author("irishman").

%% API
-export([element_at/2]).


element_at([H|_], 1) ->
  H;
element_at([], _) ->
  undefined;
element_at([_|T], N) ->
  element_at(T, N-1).