%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2018 21:11
%%%-------------------------------------------------------------------
-module(bs03).
-author("irishman").

%% API
-export([split/2]).


split(BinText, Sep) ->
  split(BinText, list_to_binary(Sep), length(Sep), <<>>, []).

split(BinText, Sep, Len, IAcc, RAcc) ->
  case BinText of
    <<Str:Len/binary, Rest/binary>> when Str == Sep, Len /= 0 ->
      split(Rest, Sep, Len, <<>>, [IAcc|RAcc]);
    <<H, Rest/binary>> ->
      split(Rest, Sep, Len, <<IAcc/binary, H>>, RAcc);
    <<>> ->
      lists:reverse([IAcc|RAcc])
  end.