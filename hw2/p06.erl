%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:36 AM
%%%-------------------------------------------------------------------
-module(p06).
-author("irishman").
-import(p05, [reverse/1]).

%% API
-export([is_palindrome/1]).


is_palindrome(L) ->
  L =:= reverse(L).