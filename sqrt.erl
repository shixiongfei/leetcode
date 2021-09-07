-module(sqrt).
-export([my_sqrt/1]).

%% x 的平方根
%% https://leetcode-cn.com/problems/sqrtx/description

my_sqrt(X, Low, High) ->
    Mid = (Low + High) / 2,
    M2 = Mid * Mid,
    if
        abs(M2 - X) < 0.00001 -> trunc(Mid);
        M2 < X -> my_sqrt(X, Mid + 1, High);
        true -> my_sqrt(X, Low, Mid - 1)
    end.

-spec my_sqrt(X :: integer()) -> integer().
my_sqrt(X) ->
  if
      X =< 1 -> X;
      true -> my_sqrt(X, 0, X)
  end.
