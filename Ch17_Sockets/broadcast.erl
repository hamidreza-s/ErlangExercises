-module(broadcast).
-compile(export_all).

sent(IoList) ->
	case inet:ifget("wlp2s0", [broadaddr]) of
		{ok, [{broadaddr, Ip}]} ->
			{ok, S} = gen_udp:open(5010, [{broadcast, true}]),
			gen_udp:send(S, Ip, 6000, IoList),
			gen_udp:close(S);
		_ ->
			io:format("Bad interface name, or\n"
				"broadcasting not supported\n")
	end.
	
listen() ->
	{ok, _} = gen_udp:open(6000),
	loop().

loop() ->
	receive
		Any ->
			io:format("received: ~p~n", [Any]),
			loop()
	end.
