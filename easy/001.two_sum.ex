defmodule Solution do
  @moduledoc """
  1. Two Sum
  https://leetcode.com/problems/two-sum/submissions/

  Given an array of integers nums and an integer target, return indices
  of the two numbers such that they add up to target.
  You may assume that each input would have exactly one solution,
  and you may not use the same element twice.

  You can return the answer in any order.

  ##################
  ### Example 1: ###
  ##################

  Input: nums = [2,7,11,15], target = 9
  Output: [0,1]
  Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

  ##################
  ### Example 2: ###
  ##################

  Input: nums = [3,2,4], target = 6
  Output: [1,2]

  ##################
  ### Example 3: ###
  ##################

  Input: nums = [3,3], target = 6
  Output: [0,1]
  """

  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    Enum.reduce_while(nums, {%{}, 0}, fn num, {acc, index} ->
      expected_number = acc[target - num]

      if expected_number,
        do: {:halt, [expected_number, index]},
        else: {:cont, {Map.put(acc, num, index), index + 1}}
    end)
  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule SolutionTest do
      use ExUnit.Case

      test "Solution.two_sum/2" do
        assert Solution.two_sum([2, 7, 11, 15], 9) == [0, 1]
        assert Solution.two_sum([3, 2, 4], 6) == [1, 2]
        assert Solution.two_sum([3, 3], 6) == [0, 1]
      end
    end

  _ ->
    IO.puts(:stderr, "\nplease specify --test")
end
