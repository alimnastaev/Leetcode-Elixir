defmodule Solution do
  @moduledoc """
  136. Single Number
  https://leetcode.com/problems/single-number

  Given a non-empty array of integers nums, every element appears twice except for one.
  Find that single one.

  You must implement a solution with a linear runtime complexity and use only constant extra space.

  ##################
  ### Example 1: ###
  ##################

  Input: nums = [2,2,1]
  Output: 1

  ##################
  ### Example 2: ###
  ##################

  Input: nums = [4,1,2,1,2]
  Output: 4

  ##################
  ### Example 3: ###
  ##################

  Input: nums = [1]
  Output: 1
  """

  @spec single_number(array :: [non_neg_integer()]) :: non_neg_integer()
  def single_number(array) do
    array
    |> Enum.frequencies()
    |> Enum.find_value(fn
      {result, 1} -> result
      _ -> false
    end)
  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule SolutionTest do
      use ExUnit.Case

      test "Solution.single_number/1" do
        assert Solution.single_number([2, 2, 1]) == 1
        assert Solution.single_number([4, 1, 2, 1, 2]) == 4
        assert Solution.single_number([1]) == 1
      end
    end

  _ ->
    IO.puts(:stderr, "\nplease specify --test")
end
