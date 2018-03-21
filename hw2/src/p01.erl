%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(p01).
-author("irishman").

%% API
-export([last/1]).


last([X]) ->
  X;
last([_|T]) ->
  last(T).