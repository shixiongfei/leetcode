-module(count_primes).
-export([count_primes/1]).

%% 计数质数
%% https://leetcode-cn.com/problems/count-primes/description

-spec count_primes(N :: integer()) -> integer().
count_primes(N) ->
  count_primes(N, 0, 2, #{N => true}).


mark_notprimes(Step, NotPrimes, Q) when Step > Q -> NotPrimes;
mark_notprimes(Step, NotPrimes, Q) ->
  lists:foldl(fun(I, M) -> maps:put(Step * I, true, M) end, NotPrimes, lists:seq(Step, Q)).

count_primes(N, Count, Step, _) when Step > N -> Count;
count_primes(N, Count, Step, NotPrimes) ->
  case maps:is_key(Step, NotPrimes) of
    true -> count_primes(N, Count, Step + 1, NotPrimes);
    false -> count_primes(N, Count + 1, Step + 1, mark_notprimes(Step, NotPrimes, N div Step))
  end.
