%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2018 21:15
%%%-------------------------------------------------------------------
-module(hw3_test).
-author("irishman").

%% API
-export([start/0]).


start() ->
  test_bs01(),
  test_bs02(),
  test_bs03(),
  {'tests is Passed'}.

test_bs01() ->
  BinText = <<"Some text">>,
  <<"Some">> = bs01:first_word(BinText).

test_bs02() ->
  BinText = <<"Text with four words">>,
  [<<"Text">>, <<"with">>, <<"four">>, <<"words">>] = bs02:words(BinText).

test_bs03() ->
  BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>,
  [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] = bs03:split(BinText, "-:-").
