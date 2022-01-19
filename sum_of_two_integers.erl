-module(sum_of_two_integers).
-export([get_sum/2]).

%% 两整数之和
%% https://leetcode-cn.com/problems/sum-of-two-integers/

-spec get_sum(A :: integer(), B :: integer()) -> integer().
get_sum(A, B) when B == 0 ->
  if
    %% 正数直接返回
    A < 16#80000000 -> A;
    %% 负数需要返回补码
    true -> -((bnot(A) band 16#ffffffff) + 1)
  end;
get_sum(A, B) ->
  Sum =(A bxor B) band 16#ffffffff,
  Carry = (A band B bsl 1) band 16#ffffffff,
  get_sum(Sum, Carry).
