-module(erlycache_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [{"/api/cache_server", cache_handler, []}]}
	]),
	{ok, _} = cowboy:start_clear(http,
		[{port, 8080}],
		#{env => #{dispatch => Dispatch}}
	),
	erlycache_sup:start_link().

stop(_State) ->
	ok.
