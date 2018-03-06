%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:44 AM
%%%-------------------------------------------------------------------
-module(p07).
-author("irishman").

%% API
-export([flatten/1]).


flatten([]) ->
  [];
flatten([[]|T]) ->
  flatten(T);
flatten([[H|T]|T2]) ->
  flatten([H,T|T2]);
flatten([E|T]) ->
  [E|flatten(T)].