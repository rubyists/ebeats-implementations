#!/usr/bin/env escript

main(_) ->
	io:format("@~.2f\n", [beats()]),
    halt(1).

beats() ->
	{_, Time} = calendar:universal_time(),
	Ratio = [1000/24, 1000 / (24.0 * 60.0), 1000 / (24.0 * 60.0 * 60.0)],
	Pairs = lists:zipwith(fun(R,T) -> R*T end,  Ratio, tuple_to_list(Time)),
	lists:foldl(fun(X, Sum) -> X + Sum end, 0, Pairs).

