%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2018 6:35 PM
%%%-------------------------------------------------------------------
-module(p14).
-author("irishman").

%% API
-export([duplicate/1]).


duplicate([]) ->
  [];
duplicate([H|T]) ->
  [H|[H|duplicate(T)]].