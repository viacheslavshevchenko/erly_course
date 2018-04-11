-module(erlycache_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  Procs = {erlycache,
    {cache_srv, start_link,
      [[{drop_interval, 600}]]},
    transient, 5, worker, [cache_srv]},
	{ok, {{one_for_one, 1, 5}, [Procs]}}.