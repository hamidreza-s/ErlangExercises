-module(shopping_list).
-export([total/1]).

cost(orange) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total([{What, N}|T]) -> cost(What) * N + total(T);
total([]) -> 0.

