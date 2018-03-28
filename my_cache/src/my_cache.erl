%%%-------------------------------------------------------------------
%%% @author irish_man
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Mar 2018 10:17 AM
%%%-------------------------------------------------------------------
-module(my_cache).
-include_lib("stdlib/include/ms_transform.hrl").
-author("irish_man").

%% API
-export([create/0, insert/3, lookup/1, delete_obsolete/0]).
-define(ets_name, cache).


create() ->
  try ets:new(?ets_name, [named_table]) of
    _ ->
      ok
  catch
    _:_ ->
      {error, name_is_busy}
  end.


insert(Key, Value, Timer) ->
  LifeTime = calendar:time_to_seconds(time()) + Timer,
  case ets:insert(?ets_name, {Key, Value, LifeTime}) of
    true ->
      ok;
    _ ->
      {error, not_inserted}
  end.


lookup(Key) ->
  case ets:lookup(?ets_name, Key) of
    [{Key, Value, LifeTime}] ->
      CurrentTime = calendar:time_to_seconds(time()),
      if
        LifeTime >= CurrentTime ->
          {ok, Value};
        true ->
          {error, value_is_deprecated}
      end;
    [] ->
      []
  end.

delete_obsolete() ->
  CurrentTime = calendar:time_to_seconds(time()),
  ets:select_delete(?ets_name, ets:fun2ms(fun({_,_,Time}) when Time < CurrentTime -> true end)),
  ok.
