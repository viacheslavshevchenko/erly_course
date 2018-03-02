%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2018 6:35 PM
%%%-------------------------------------------------------------------
-module(p08).
-author("irish_man").

%% API
-export([remove_duplicates/1]).



delete_all(Item, [Item | Rest_of_list]) ->
  delete_all(Item, Rest_of_list);
delete_all(Item, [Another_item| Rest_of_list]) ->
  [Another_item | delete_all(Item, Rest_of_list)];
delete_all(_, []) ->
  [].

remove_duplicates(L)->
  removing(L,[]).

removing([], Acc) ->
  Acc;
removing([H|Tail], Acc) ->
  removing(delete_all(H,Tail), [H|Acc]).