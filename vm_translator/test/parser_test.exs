defmodule ParserTest do
  use ExUnit.Case, async: true

  describe "parse/1" do
    test "returns a kwlist, with each element in the list corresponding to a command" do
      input = """
      push constant 42
      push constant 12
      add
      pop local 1
      """

      expected = [
        {:C_PUSH, [:CONSTANT, 42]},
        {:C_PUSH, [:CONSTANT, 12]},
        {:C_ADD, []},
        {:C_POP, [:LOCAL, 1]}
      ]

      assert Parser.parse(input) == expected
    end
  end
end
