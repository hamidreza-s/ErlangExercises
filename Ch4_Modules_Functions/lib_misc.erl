-module(lib_misc).
-export([qsort/1, pythag/1, perms/1, filter/2]).
-export([odds_and_evens/1]).

%% --- quick sort
qsort([]) -> [];
qsort([Pivot|T]) ->
	qsort([X || X <- T, X < Pivot])
	++ [Pivot] ++
	qsort([X || X <- T, X >= Pivot]).
	
%% --- pythagorean triple
pythag(N) -> 
	[ {A, B, C} ||
		A <- lists:seq(1, N),
		B <- lists:seq(1, N),
		C <- lists:seq(1, N),
		A+B+C =< N,
		A*A+B*B =:= C*C
	].

%% --- premutation
perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L -- [H])].

%% --- filter
filter(P, [H|T]) ->
	case P(H) of
		true -> [H|filter(P, T)];
		false -> filter(P, T)
	end;
filter(_P, []) -> [].

%% --- odd or even
odds_and_evens(L) ->
	odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
	case (H rem 2) of
		0 -> odds_and_evens_acc(T, [H|Odds], Evens);
		1 -> odds_and_evens_acc(T, Odds, [H|Evens])
	end;
odds_and_evens_acc([], Odds, Evens) -> 
	{lists:reverse(Odds), lists:reverse(Evens)}.















