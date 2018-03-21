%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2018 6:35 PM
%%%-------------------------------------------------------------------
-module(p08).
-author("irishman").

%% API
-export([compress/1, compress_all/1]).


compress([])->
  [];
compress([H|[]])->
  [H];
compress([H|[H|T]])->
  compress([H|T]);
compress([H|[H1|T]])->
  [H|compress([H1|T])].

% Compress all list, remove duplicate
compress_all(L)->
  compress(L, []).

compress([], Acc) ->
  lists:reverse(Acc);
compress([H|T], Acc) ->
  compress(delete(H,T), [H|Acc]).

delete(_, []) ->
  [];
delete(I, [I|T]) ->
  delete(I, T);
delete(I, [Ai|T]) ->
  [Ai|delete(I, T)].