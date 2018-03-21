%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(hw2_tests).
-ifdef(TEST).
-author("irishman").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).


p01_last_test_() ->
  ?_test(?assert(p01:last([a,b,c,d,e,f]) =:= f)).

p02_but_last_test() ->
  ?assert(p02:but_last([a,b,c,d,e,f]) =:= [e,f]).

p03_element_at_test_() ->
  [
    ?_assert(p03:element_at([a,b,c,d,e,f], 4) =:= d),
    ?_assert(p03:element_at([a,b,c,d,e,f], 10) =:= undefined)
  ].

p04_len_test_() ->
  [
    ?_assert(p04:len([]) =:= 0),
    ?_assert(p04:len([a,b,c,d]) =:= 4)
  ].

p05_reverse_test() ->
  ?assert(p05:reverse([1,2,3]) =:= [3,2,1]).

p06_is_palindrome_test() ->
  ?assert(p06:is_palindrome([1,2,3,2,1]) =:= true).

p06_new_palindrome_test() ->
  ?assert(p06:new_palindrome([1,2,3,2,1]) =:= true).

p07_flatten_test() ->
  ?assert(p07:flatten([a,[],[b,[c,d],e]]) =:= [a,b,c,d,e]).

p08_compress_test() ->
  ?assert(p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [a,b,c,a,d,e]).

p09_pack_test() ->
  ?assert(p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]).

p10_encode_test() ->
  ?assert(p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).

p11_encode_modified_test() ->
  ?assert(p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},b,{2,c},{2,a},d,{4,e}]).

p12_decode_modified_test() ->
  ?assert(p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]).

p13_decode_test() ->
  ?assert(p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]).

p14_duplicate_test() ->
  ?assert(p14:duplicate([a,b,c,c,d]) =:= [a,a,b,b,c,c,c,c,d,d]).

p15_replicate_test() ->
  ?assert(p15:replicate([a,b,c], 3) =:= [a,a,a,b,b,b,c,c,c]).

-endif.