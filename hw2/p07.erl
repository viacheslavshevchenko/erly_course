%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:44 AM
%%%-------------------------------------------------------------------
-module(p07).
-author("irish_man").

%% API
-export([flatten/1]).


flatten([[H|T1]|T2]) ->
  flatten([H,T1|T2]);
flatten([[]|T]) ->
  flatten(T);
flatten([E|T]) ->
  [E|flatten(T)];
flatten([]) ->
  [].