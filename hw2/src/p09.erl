%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2018 6:35 PM
%%%-------------------------------------------------------------------
-module(p09).
-author("irishman").
-import(p05, [reverse/1]).

%% API
-export([pack/1]).


pack(L) ->
  pack(L, []).

pack([], Acc) ->
  reverse(Acc);
pack([H], Acc) ->
  pack([], [H|Acc]);
pack([H|[H|T]], Acc) ->
  pack([[H,H]|T], Acc);
pack([[H|T1]|[H|T2]], Acc) ->
  pack([[H|[H|T1]]|T2], Acc);
pack([[H1|T1]|[H2|T2]], Acc) ->
  pack([H2|T2], [[H1|T1]|Acc]);
pack([H1|[H2|T]], Acc) ->
  pack([H2|T], [[H1]|Acc]).