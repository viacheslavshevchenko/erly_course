%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2018 6:35 PM
%%%-------------------------------------------------------------------
-module(p08).
-author("irish_man").

%% API
-export([compress/1]).
-import(p05, [tail_reverse/1]).


compress(L)->
  compress(L, []).

compress([], Acc) ->
  tail_reverse(Acc);
compress([H|T], Acc) ->
  compress(delete(H,T), [H|Acc]).

delete(_, []) ->
  [];
delete(I, [I|T]) ->
  delete(I, T);
delete(I, [Is|T]) ->
  [Is|delete(I, T)].