%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:24 AM
%%%-------------------------------------------------------------------
-module(p04).
-author("irish_man").

%% API
-export([len/1, tail_len/1]).

len([]) ->
  0;
len([_|T]) ->
  1 + len(T).

tail_len(L) ->
  tail_len(L, 0).

tail_len([_|T], Acc) ->
  tail_len(T, Acc+1);
tail_len([], Acc) ->
  Acc.
