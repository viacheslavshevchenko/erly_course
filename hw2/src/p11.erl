%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(p11).
-author("irishman").

%% API
-export([encode_modified/1]).


encode_modified([]) ->
  [];
encode_modified([[Count,Elem]|[Elem|[]]]) ->
  [{Count+1,Elem}];
encode_modified([[Count,Elem]|[Elem|T]]) ->
  encode_modified([[Count+1,Elem]|T]);
encode_modified([[Count,Elem1]|[Elem2|[]]]) ->
  [{Count,Elem1},Elem2];
encode_modified([[1,Elem1]|[Elem2]]) ->
  [Elem1|[Elem2]];
encode_modified([[1,Elem1]|[Elem2|T]]) ->
  [Elem1|encode_modified([[1,Elem2]|T])];
encode_modified([[Count,Elem1]|[Elem2|T]]) ->
  [{Count,Elem1}|encode_modified([[1,Elem2]|T])];
encode_modified([H|T]) ->
  encode_modified([[1,H]|T]).