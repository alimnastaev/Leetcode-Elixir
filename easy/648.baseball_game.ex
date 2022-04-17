defmodule Solution do
  @moduledoc """
  682. Baseball Game
  https://leetcode.com/problems/baseball-game

  You are keeping score for a baseball game with strange rules.
  The game consists of several rounds, where the scores of past rounds
  may affect future rounds' scores.

  At the beginning of the game, you start with an empty record.
  You are given a list of strings ops, where ops[i] is the ith operation
  you must apply to the record and is one of the following:

  An integer x - Record a new score of x.
  "+" - Record a new score that is the sum of the previous two scores.
  It is guaranteed there will always be two previous scores.

  "D" - Record a new score that is double the previous score.
  It is guaranteed there will always be a previous score.

  "C" - Invalidate the previous score, removing it from the record.
  It is guaranteed there will always be a previous score.

  Return the sum of all the scores on the record.
  The test cases are generated so that the answer fits in a 32-bit integer.

  ##################
  ### Example 1: ###
  ##################

  Input: ops = ["5", "2", "C", "D", "+"]
  Output: 30

  Explanation:

  "5" - Add 5 to the record, record is now [5].
  "2" - Add 2 to the record, record is now [5, 2].
  "C" - Invalidate and remove the previous score, record is now [5].
  "D" - Add 2 * 5 = 10 to the record, record is now [5, 10].
  "+" - Add 5 + 10 = 15 to the record, record is now [5, 10, 15].

  The total sum is 5 + 10 + 15 = 30.

  ##################
  ### Example 2: ###
  ##################

  Input: ops = ["5", "-2", "4", "C", "D", "9", "+", "+"]
  Output: 27

  Explanation:

  "5" - Add 5 to the record, record is now [5].
  "-2" - Add -2 to the record, record is now [5, -2].
  "4" - Add 4 to the record, record is now [5, -2, 4].
  "C" - Invalidate and remove the previous score, record is now [5, -2].
  "D" - Add 2 * -2 = -4 to the record, record is now [5, -2, -4].
  "9" - Add 9 to the record, record is now [5, -2, -4, 9].
  "+" - Add -4 + 9 = 5 to the record, record is now [5, -2, -4, 9, 5].
  "+" - Add 9 + 5 = 14 to the record, record is now [5, -2, -4, 9, 5, 14].

  The total sum is 5 + -2 + -4 + 9 + 5 + 14 = 27.
  """

  @spec cal_points(ops :: [String.t()]) :: non_neg_integer()
  def cal_points(ops) do
    [_, result] = Enum.reduce(array, [[], 0], &count/2)

    result
  end

  defp count("C", [[first | stack], result]) do
    [stack, result - first]
  end

  defp count("D", [[first | _acc] = stack, result]) do
    double_of_previous = first * 2

    [[double_of_previous | stack], result + double_of_previous]
  end

  defp count("+", [[first, second | _rest] = stack, result]) do
    sum_of_previous_two = first + second

    [[sum_of_previous_two | stack], result + sum_of_previous_two]
  end

  defp count(item, [stack, result]) do
    number = String.to_integer(item)
    [[number | stack], result + number]
  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule SolutionTest do
      use ExUnit.Case

      test "tests according to the test data from assessment" do
        assert Solution.cal_points(["5", "2", "C", "D", "+"]) == 30
        assert Solution.cal_points(["5", "-2", "4", "C", "D", "9", "+", "+"]) == 27
        assert Solution.cal_points(["1"]) == 1
      end
    end

  _ ->
    IO.puts(:stderr, "\nplease specify --test")
end
