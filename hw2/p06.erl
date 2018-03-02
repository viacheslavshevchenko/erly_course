%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:36 AM
%%%-------------------------------------------------------------------
-module(p06).
-author("irish_man").

%% API
-export([is_palindrome/1]).
-import(p05, [tail_reverse/1]).


is_palindrome(L) ->
  L =:= tail_reverse(L).