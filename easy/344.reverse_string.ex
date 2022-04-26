defmodule Solution do
  @moduledoc """
  344. Reverse String
  https://leetcode.com/problems/reverse-string/

  Write a function that reverses a string. The input string is given as an array of characters s.

  You must do this by modifying the input array in-place with O(1) extra memory.

  ##################
  ### Example 1: ###
  ##################

  Input: s = ["h","e","l","l","o"]
  Output: ["o","l","l","e","h"]

  ##################
  ### Example 2: ###
  ##################

  Input: s = ["H","a","n","n","a","h"]
  Output: ["h","a","n","n","a","H"]
  """

  @spec reverse_string(array :: [String.t()]) :: [String.t()]
  def reverse_string(array), do: do_job(array, [])
  def do_job([], result), do: result
  def do_job([chr | tail], result), do: do_job(tail, [chr | result])
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule SolutionTest do
      use ExUnit.Case

      test "Solution.two_sum/2" do
        assert Solution.reverse_string(["h", "e", "l", "l", "o"]) == ["o", "l", "l", "e", "h"]

        assert Solution.reverse_string(["H", "a", "n", "n", "a", "h"]) == [
                 "h",
                 "a",
                 "n",
                 "n",
                 "a",
                 "H"
               ]
      end
    end

  _ ->
    IO.puts(:stderr, "\nplease specify --test")
end
