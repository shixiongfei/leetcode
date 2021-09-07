-module(fibonacci).
-export([fib/1]).

%% 斐波那契数
%% https://leetcode-cn.com/problems/fibonacci-number/

fib(A, _, Step) when Step == 0 -> A;
fib(A, B, Step) -> fib(A + B, A, Step - 1).

-spec fib(N :: integer()) -> integer().
fib(N) ->
  fib(0, 1, N).
