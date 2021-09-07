-module(pow).
-export([my_pow/2]).

%% Pow(x, n)
%% https://leetcode-cn.com/problems/powx-n/description

my_pow(_, 0, Accum) -> Accum;
my_pow(X, N, _) when N < 0 -> my_pow(1 / X, -N, 1.0);
my_pow(X, N, Accum) when N rem 2 == 0 -> my_pow(X * X, N div 2, Accum);
my_pow(X, N, Accum) -> my_pow(X, N - 1, Accum * X).

-spec my_pow(X :: float(), N :: integer()) -> float().
my_pow(X, N) ->
  my_pow(X, N, 1.0).
