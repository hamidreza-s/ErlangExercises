-module(test3).
-export([test/0, factorial/1]).

test() -> factorial(-5).
%% Correct argument:
%% factorial(> 0)

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).