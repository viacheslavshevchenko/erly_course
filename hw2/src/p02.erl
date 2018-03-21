%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 10:29 AM
%%%-------------------------------------------------------------------
-module(p02).
-author("irishman").

%% API
-export([but_last/1]).


but_last([_,_]=L) ->
  L;
but_last([_|T]) ->
  but_last(T).