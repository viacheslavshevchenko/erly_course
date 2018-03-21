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

-import(p05, [reverse/1]).
%% API
-export([flatten/1, tail_flatten/1]).


flatten([]) ->
  [];
flatten([[]|T]) ->
  flatten(T);
flatten([[H|T]|T2]) ->
  flatten([H,T|T2]);
flatten([E|T]) ->
  [E|flatten(T)].

%% Tail optimize algorithm
%% -------------------------------------------------------------------
tail_flatten(L) ->
  tail_flatten(L, []).

tail_flatten([],Acc) ->
  reverse(Acc);
tail_flatten([[]|T], Acc) ->
  tail_flatten(T, Acc);
tail_flatten([[H|T]|T2], Acc) ->
  tail_flatten([H,T|T2], Acc);
tail_flatten([H|T], Acc) ->
  tail_flatten(T, [H|Acc]).