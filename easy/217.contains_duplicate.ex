defmodule Solution do
  @moduledoc """
  217. Contains Duplicate
  https://leetcode.com/problems/contains-duplicate/

  Given an integer array nums,
  return true if any value appears at least twice in the array,
  and return false if every element is distinct.

  ##################
  ### Example 1: ###
  ##################

  Input: nums = [1,2,3,1]
  Output: true

  ##################
  ### Example 2: ###
  ##################

  Input: nums = [1,2,3,4]
  Output: false

  ##################
  ### Example 3: ###
  ##################

  Input: nums = [1,1,1,3,3,4,3,2,4,2]
  Output: true
  """

  @spec contains_duplicate?(nums :: [non_neg_integer()]) :: boolean()
  def contains_duplicate?(nums) do
    Enum.reduce_while(nums, %{}, fn item, acc ->
      if acc[item], do: {:halt, true}, else: {:cont, Map.put(acc, item, true)}
    end)
    |> is_boolean()
  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule SolutionTest do
      use ExUnit.Case

      test "tests according to the test data from assessment" do
        assert Solution.contains_duplicate?([1, 2, 3, 1]) == true
        assert Solution.contains_duplicate?([1, 2, 3, 4]) == false
        assert Solution.contains_duplicate?([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) == true
      end
    end

  _ ->
    IO.puts(:stderr, "\nplease specify --test")
end
