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
-export([is_palindrome/1, new_palindrome/1]).


is_palindrome(L) ->
  L =:= reverse(L).


new_palindrome(L) ->
  new_palindrome(L,reverse(L)).

new_palindrome([H|T1],[H|T2]) ->
  new_palindrome(T1,T2);
new_palindrome([],[]) ->
  true;
new_palindrome(_,_) ->
  false.
