-module(lib_misc).
-compile(export_all).

consult(File) ->
	case file:open(File, read) of
		{ok, S} ->
			Val = examine(S),
			file:close(File),
			{ok, Val};
		{error, Why} ->
			{error, Why}
	end.

examine(S) ->
	case io:read(S, '') of
		{ok, Term} 	-> [Term|examine(S)];
		eof				 	-> [];
		Error				-> Error
	end.

unconsult(File, L) ->
	{ok, S} = file:open(File, write),
	lists:foreach(fun(X) -> io:format(S, "~p.~n", [X]) end, L),
	file:close(S).
