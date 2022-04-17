defmodule Solution do
  @moduledoc """
  20. Valid Parentheses
  https://leetcode.com/problems/valid-parentheses/

  Given a string s containing just the characters:
  '(', ')', '{', '}', '[' and ']'
  determine if the input string is valid.

  An input string is valid if:
  -- Open brackets must be closed by the same type of brackets.
  -- Open brackets must be closed in the correct order.

  ##################
  ### Example 1: ###
  ##################

  Input: s = "()"
  Output: true

  ##################
  ### Example 2: ###
  ##################

  Input: s = "()[]{}"
  Output: true

  ##################
  ### Example 3: ###
  ##################

  Input: s = "(]"
  Output: false
  """

  @spec is_valid?(s :: String.t()) :: boolean()
  def is_valid?(""), do: false
  def is_valid?(s), do: run_check("", s)

  def run_check("", ""), do: true
  def run_check(stack, "{}" <> rest_string), do: run_check(stack, rest_string)
  def run_check(stack, "[]" <> rest_string), do: run_check(stack, rest_string)
  def run_check(stack, "()" <> rest_string), do: run_check(stack, rest_string)
  def run_check("[" <> stack, "]" <> rest_string), do: run_check(stack, rest_string)
  def run_check("(" <> stack, ")" <> rest_string), do: run_check(stack, rest_string)
  def run_check("{" <> stack, "}" <> rest_string), do: run_check(stack, rest_string)

  def run_check(stack, <<top::binary-size(1)>> <> rest_string),
    do: run_check(top <> stack, rest_string)

  def run_check(_, _), do: false
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule SolutionTest do
      use ExUnit.Case

      test "tests according to the test data from assessment" do
        assert Solution.is_valid?("()") == true
        assert Solution.is_valid?("()[]{}") == true
        assert Solution.is_valid?("(]") == false
        assert Solution.is_valid?("][") == false
        assert Solution.is_valid?("{[()]}") == true
      end
    end

  _ ->
    IO.puts(:stderr, "\nplease specify --test")
end
