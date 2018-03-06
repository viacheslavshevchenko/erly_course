%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(p13).
-author("irishman").

%% API
-export([decode/1]).


decode([]) ->
  [];
decode([{1,Elem}]) ->
  [Elem];
decode([{Count,Elem}]) ->
  [Elem|decode([{Count-1,Elem}])];
decode([{1,Elem}|T]) ->
  [Elem|decode(T)];
decode([{Count,Elem}|T]) ->
  [Elem|decode([{Count-1,Elem}|T])].