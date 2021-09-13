-module(count_primes).
-export([count_primes/1]).

%% 计数质数
%% https://leetcode-cn.com/problems/count-primes/description

-spec count_primes(N :: integer()) -> integer().
count_primes(N) ->
  NotPrimes = ets:new(not_primes, []),
  ets:insert(NotPrimes, {N, true}),
  count_primes(N, 0, 2, NotPrimes).


mark_notprimes(Step, _, Q) when Step > Q -> ok;
mark_notprimes(Step, NotPrimes, Q) ->
  lists:foreach(fun(I) -> ets:insert(NotPrimes, {Step * I, true}) end,
                lists:seq(Step, Q, 2)).

count_primes(N, Count, Step, _) when Step > N -> Count;
count_primes(N, Count, Step, NotPrimes) when Step /= 2 andalso Step rem 2 == 0 ->
  count_primes(N, Count, Step + 1, NotPrimes);
count_primes(N, Count, Step, NotPrimes) ->
  case ets:lookup(NotPrimes, Step) of
    [_] -> count_primes(N, Count, Step + 1, NotPrimes);
    [] -> mark_notprimes(Step, NotPrimes, N div Step),
          count_primes(N, Count + 1, Step + 1, NotPrimes)
  end.
