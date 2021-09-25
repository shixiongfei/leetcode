-module(add_two_numbers).
-export([add_two_numbers/2]).

%% 两数相加
%% https://leetcode-cn.com/problems/add-two-numbers/description/


%% Definition for singly-linked list.
-record(list_node, {val = 0 :: integer(),
                    next = null :: 'null' | #list_node{}}).


reverse_list(Head, null, _) -> Head;
reverse_list(_, Current, Pre) ->
  #list_node{next = Next} = Current,
  NewNode = Current#list_node{next = Pre},
  reverse_list(NewNode, Next, NewNode).

reverse_list(L) ->
  reverse_list(L, L, null).


add_two_numbers(Total, 0, null, null) ->
  reverse_list(Total);
add_two_numbers(Total, Carry, L1, L2) ->
  {N1, L1Next} = case L1 of
         null -> {0, null};
         _ -> {L1#list_node.val, L1#list_node.next}
       end,

  {N2, L2Next} = case L2 of
         null -> {0, null};
         _ -> {L2#list_node.val, L2#list_node.next}
       end,

  S = N1 + N2 + Carry,
  X = #list_node{val = S rem 10},

  add_two_numbers(X#list_node{next = Total}, S div 10, L1Next, L2Next).


-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.
add_two_numbers(L1, L2) ->
  add_two_numbers(null, 0, L1, L2).
