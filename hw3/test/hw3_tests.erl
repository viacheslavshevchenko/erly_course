%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2018 21:15
%%%-------------------------------------------------------------------
-module(hw3_tests).
-ifdef(TEST).
-author("irishman").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).


bs01_first_word_test() ->
  ?assert(bs01:first_word(<<"Some text">>) =:= <<"Some">>).

bs02_words_test() ->
  ?assert(bs02:words(<<"Text with four words">>) =:= [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]).

bs03_split_test() ->
  BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>,
  ?assert(bs03:split(BinText, "-:-") =:= [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]).

bs04_decode_xml_test() ->
  BinXML = <<"<start><item>Text1</item><item>Text2</item></start>">>,
  ?assert(bs04:decode_xml(BinXML) =:=  {<<"start">>,[],[{<<"item">>,[],[<<"Text1">>]},{<<"item">>,[],[<<"Text2">>]}]}).

-endif.