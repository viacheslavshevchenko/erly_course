%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:24 AM
%%%-------------------------------------------------------------------
-module(p04).
-author("irishman").

%% API
-export([len/1]).


len(L) ->
  len(L, 0).

len([], Acc) ->
  Acc;
len([_|T], Acc) ->
  len(T, Acc+1).