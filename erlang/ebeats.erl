-module(ebeats).
-export([print_ebeats/0]).

print_ebeats() ->
	io:format("@~.2f\n", [beats()]).

beats() ->
	{_, Time} = calendar:universal_time(),
	Ratio = [1000/24, 1000 / (24.0 * 60.0), 1000 / (24.0 * 60.0 * 60.0)],
	Pairs = lists:zipwith(fun(R,T) -> R*T end,  Ratio, tuple_to_list(Time)),
	lists:foldl(fun(X, Sum) -> X + Sum end, 0, Pairs).