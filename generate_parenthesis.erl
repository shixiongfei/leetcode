-module(generate_parenthesis).
-export([generate_parenthesis/1]).

%% 括号生成
%% https://leetcode-cn.com/problems/generate-parentheses/description

generate(Res, Cur, Left, Right) ->
  if Left == 0 andalso Right == 0 ->
      [{result, T}] = ets:lookup(Res, result),
      ets:insert(Res, {result, lists:append(T, [Cur])});
     true ->
      if Left > 0 -> generate(Res, string:concat(Cur, "("), Left - 1, Right);
         true -> nothing_to_do
      end,

      if Left < Right -> generate(Res, string:concat(Cur, ")"), Left, Right - 1);
         true -> nothing_to_do
      end
  end,
  [{result, Result}] = ets:lookup(Res, result),
  lists:map(fun list_to_binary/1, Result).


-spec generate_parenthesis(N :: integer()) -> [unicode:unicode_binary()].
generate_parenthesis(N) ->
  Res = ets:new(gp, [set]),
  ets:insert(Res, {result, []}),
  generate(Res, "", N, N).
