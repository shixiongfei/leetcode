-module(two_sum).
-export([two_sum/2]).

%% 两数之和
%% https://leetcode-cn.com/problems/two-sum/description/

two_sum(_, [], _, _) -> [-1, -1];
two_sum(Hashes, [Head | Tail], Index, Target) ->
    case maps:is_key(Head, Hashes) of
        true -> [maps:get(Head, Hashes), Index];
        false -> two_sum(maps:put(Target - Head, Index, Hashes), Tail, Index + 1, Target)
    end.

-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
  two_sum(#{}, Nums, 0, Target).
