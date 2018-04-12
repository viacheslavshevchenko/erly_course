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
-export([init/2, json_handler/3]).

init(Req, State) ->
  Method = cowboy_req:method(Req),
  HasBody = cowboy_req:has_body(Req),
  Res = json_handler(Method, HasBody, Req),
  {ok, Res, State}.


json_handler(<<"POST">>, true, Req) ->
  {ok, Post, Req0} = cowboy_req:read_body(Req),
  case jsx:decode(Post) of
    [{<<"action">>,<<"insert">>},{<<"key">>, Key},{<<"value">>, Value}] ->
      Result = cache_srv:insert(Key, Value, 600),
      response_handler(Result, Req0);
    [{<<"action">>,<<"lookup">>},{<<"key">>, Key}] ->
      Result = cache_srv:lookup(Key),
      case Result of
        {ok, Res} ->
          response_handler(Res, Req0);
        _ = Res ->
          response_handler(Res, Req0)
      end;
    [{<<"action">>,<<"lookup_by_date">>},{<<"date_from">>, DateFrom},{<<"date_to">>, DateTo}] ->
      Result = cache_srv:lookup_by_date(binary_to_datetime(DateFrom), binary_to_datetime(DateTo)),
      response_handler(Result, Req0);
    _ ->
      response_handler(<<"Incorrect request">>, Req0)
  end;
json_handler(_, _, Req) ->
  response_handler(<<"Incorrect request">>, Req).

response_handler(Response, Req) ->
  Headers = #{<<"content-type">> => <<"application/json">>},
  cowboy_req:reply(200, Headers, jsx:encode([{<<"result">>, Response}]), Req).

binary_to_datetime(Bin) ->
  CorrectBin = binary:replace(Bin, [<<"/">>, <<":">>, <<" ">>], <<",">>, [global]),
  [Year, Month, Day, Hour, Min, Sec] = binary_to_datetime(CorrectBin, []),
  {{Year,Month,Day},{Hour,Min,Sec}}.

binary_to_datetime(Bin, Acc) ->
  case binary:split(Bin, <<",">>) of
    [<<>>] ->
      lists:reverse(Acc);
    [H,T] ->
      binary_to_datetime(T, [binary_to_integer(H)|Acc]);
    [R] ->
      binary_to_datetime(<<>>, [binary_to_integer(R)|Acc])
  end.