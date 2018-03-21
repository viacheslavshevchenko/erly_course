%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(p12).
-author("irishman").

%% API
-export([decode_modified/1]).


decode_modified([]) ->
  [];
decode_modified([{2,Elem}]) ->
  [Elem,Elem];
decode_modified([{Count,Elem}]) ->
  [Elem|decode_modified([{Count-1,Elem}])];
decode_modified([{2,Elem}|T]) ->
  [Elem|[Elem|decode_modified(T)]];
decode_modified([{Count,Elem}|T]) ->
  [Elem|decode_modified([{Count-1,Elem}|T])];
decode_modified([H|[{Count,Elem}|T]]) ->
  [H|decode_modified([{Count,Elem}|T])];
decode_modified([H|[]]) ->
  [H].