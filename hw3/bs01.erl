%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2018 21:04
%%%-------------------------------------------------------------------
-module(bs01).
-author("irishman").

%% API
-export([first_word/1]).


first_word(BinText) ->
  first_word(BinText, <<>>).

first_word(<<" "/utf8, _/binary>>, Acc) ->
  Acc;
first_word(<<H/utf8, Rest/binary>>, Acc) ->
  first_word(Rest, <<Acc/binary, H>>).