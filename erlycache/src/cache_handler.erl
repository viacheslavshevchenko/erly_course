%%%-------------------------------------------------------------------
%%% @author vshev4enko
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Apr 2018 13:25
%%%-------------------------------------------------------------------
-module(cache_handler).
-author("vshev4enko").

%% API
-export([init/2, handle/3]).

init(Req, State) ->
  Method = cowboy_req:method(Req),
  HasBody = cowboy_req:has_body(Req),
  Req0 = handle(Method, HasBody, Req),
  {ok, Req0, State}.

handle(<<"POST">>, true, Req) ->
  Headers = #{<<"content-type">> => <<"application/json">>},
  {ok, Post, Req0} = cowboy_req:read_body(Req),
  case jsx:decode(Post) of
    [{<<"action">>,<<"insert">>, {<<"key">>,_ = Key},{<<"value">>, _ = Value}}] ->
      R = cache_srv:insert(Key, Value, 600),
      io:format("~p~n", [R]),
      response(Headers, [{"result", R}], Req0);
    _ ->
      response(Headers, [{"error", ""}], Req0)
  end.

response(Headers, Result, Req) ->
  cowboy_req:reply(200, Headers, jsx:encode(Result), Req).

%%content_types_provided(Req, State) ->
%%  {[
%%    {<<"application/json">>, handle_json}
%%  ], Req, State}.
%%
%%handle_json(Req0, State) ->
%%  io:format("~p~n", [Req0]),
%%  Res = jsx:encode([{<<"Hello">>, <<"JSX">>}]),
%%  {Res, Req0, State}.