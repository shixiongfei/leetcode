-module(count_primes).
-export([count_primes/1]).

%% 计数质数
%% https://leetcode-cn.com/problems/count-primes/description

-spec count_primes(N :: integer()) -> integer().
count_primes(N) ->
  length(lists:filter(fun(X) -> is_prime(X) end, lists:seq(0, N - 1))).


is_prime(2) -> true;
is_prime(N) when N < 2 orelse N rem 2 == 0 -> false;
is_prime(N) -> is_prime(N, 3).

is_prime(N, K) when N < K * K -> true;
is_prime(N, K) when N rem K == 0 -> false;
is_prime(N, K) -> is_prime(N, K + 2).
