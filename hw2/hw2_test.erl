%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2018 8:38 AM
%%%-------------------------------------------------------------------
-module(hw2_test).
-author("irishman").


%% API
-export([start/0]).


start() ->
	f = p01:last([a,b,c,d,e,f]),
	[e,f] = p02:but_last([a,b,c,d,e,f]),
	d = p03:element_at([a,b,c,d,e,f], 4),
	undefined = p03:element_at([a,b,c,d,e,f], 10),
	0 = p04:len([]),
	4 = p04:len([a,b,c,d]),
	[3,2,1] = p05:reverse([1,2,3]),
	true = p06:is_palindrome([1,2,3,2,1]),
	[a,b,c,d,e] = p07:flatten([a,[],[b,[c,d],e]]),
	[a,b,c,a,d,e] = p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
	[[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]] = p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
	[{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}] = p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
	[{4,a},b,{2,c},{2,a},d,{4,e}] = p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
	[a,a,a,a,b,c,c,a,a,d,e,e,e,e] = p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]),
	[a,a,a,a,b,c,c,a,a,d,e,e,e,e] = p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]),
	[a,a,b,b,c,c,c,c,d,d] = p14:duplicate([a,b,c,c,d]),
	[a,a,a,b,b,b,c,c,c] = p15:replicate([a,b,c], 3),
	{'PASS', test_passed}.