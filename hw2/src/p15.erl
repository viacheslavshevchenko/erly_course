%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2018 6:35 PM
%%%-------------------------------------------------------------------
-module(p15).
-author("irishman").

%% API
-export([replicate/2]).


replicate([], _) ->
  [];
replicate([H|T], Count) ->
  replicate([H|T], Count, Count).

replicate([], _, _) ->
  [];
replicate([_|T], 0, Count) ->
  replicate(T, Count, Count);
replicate([H|T], C, Count) ->
  [H|replicate([H|T], C-1, Count)].