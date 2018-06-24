defmodule GeneratorTest do
  use ExUnit.Case, async: true

  describe "generate_code/1" do
    test "generates and concatenates the correct instructions" do
      input = [
        {:C_PUSH, [:CONSTANT, 42]},
        {:C_PUSH, [:CONSTANT, 12]}
      ]

      expected = """
      // push constant 42
      @42
      D=A
      @SP
      A=M
      M=D
      M=A+1
      // push constant 12
      @12
      D=A
      @SP
      A=M
      M=D
      M=A+1
      """

      assert Generator.generate_code(input) == expected
    end
  end

  describe "generate_instruction/1" do
    test "generates correct instructions for `:C_ADD`" do
      input = {:C_ADD, []}

      expected = """
      // add
      @SP
      AM=M-1
      D=M
      @SP
      AM=M-1
      A=M
      D=A+D
      @SP
      AM=M+1
      M=D
      """

      assert Generator.generate_instruction(input) == expected
    end

    test "generates correct instructions for `:C_SUB`" do
      input = {:C_SUB, []}

      expected = """
      // sub
      @SP
      AM=M-1
      D=M
      @SP
      AM=M-1
      A=M
      D=D-A
      @SP
      AM=M+1
      M=D
      """

      assert Generator.generate_instruction(input == expected)
    end

    test "generates correct instructions for `:C_PUSH` with a constant" do
      input = {:C_PUSH, [:CONSTANT, 42]}

      expected = """
      // push constant 42
      @42
      D=A
      @SP
      M=D
      M=A+1
      """

      assert Generator.generate_instruction(input == expected)
    end

    test "generate correct instructions for `:C_PUSH` with temp" do
      input = {:C_PUSH, [:TEMP, 2]}

      expected = """
      // push temp 2
      @7
      D=M
      @SP
      A=M
      M=D
      @SP
      M=M+1
      """

      assert Generator.generate_instruction(input) == expected
    end

    test "generate correct instruction for `:C_PUSH` with local" do
      input = {:C_PUSH, [:LOCAL, 3]}

      expected = """
      // push local 3
      @LCL
      D=M
      @3
      A=D+A
      D=M
      @SP
      A=M
      M=D
      @SP
      M=M+1
      """

      assert Generator.generate_instruction(input) == expected
    end
  end
end
