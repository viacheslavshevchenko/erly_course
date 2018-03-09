%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2018 21:10
%%%-------------------------------------------------------------------
-module(bs02).
-author("irishman").

%% API
-export([words/1]).


words(BinText) ->
  words(BinText, <<>>, []).

words(<<" "/utf8, Rest/binary>>, IAcc, RAcc) ->
  words(Rest, <<>>, [IAcc|RAcc]);
words(<<H/utf8, Rest/binary>>, IAcc, RAcc) ->
  words(Rest, <<IAcc/binary, H/utf8>>, RAcc);
words(<<>>, IAcc, RAcc) ->
  lists:reverse([IAcc|RAcc]).