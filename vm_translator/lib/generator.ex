defmodule Generator do
  def generate_code(ast) do
    ast
    |> Enum.map(&generate_instruction/1)
    |> Enum.join()
  end

  def generate_instruction({:C_ADD, _}) do
    """
    // add
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=M // D=M[257]
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=M+D // M[256]=M[256] + M[257]
    #{Helpers.increment_sp()}
    """
  end

  def generate_instruction({:C_SUB, _}) do
    """
    // sub
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=M // D=M[257]
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=M-D // M[256]=M[256] - M[257]
    #{Helpers.increment_sp()}
    """
  end

  def generate_instruction({:C_EQ, [command_num]}), do: BooleanOps._eq(command_num)

  def generate_instruction({:C_LT, [command_num]}), do: BooleanOps._lt(command_num)

  def generate_instruction({:C_GT, [command_num]}), do: BooleanOps._gt(command_num)

  def generate_instruction({:C_NEG, _}), do: BooleanOps._neg()

  def generate_instruction({:C_NOT, _}), do: BooleanOps._not()

  def generate_instruction({:C_AND, _}), do: BooleanOps._and()

  def generate_instruction({:C_OR, _}), do: BooleanOps._or()

  def generate_instruction({:C_PUSH, args}), do: Push.push(args)

  def generate_instruction({:C_POP, args}), do: Pop.pop(args)

  def generate_instruction({:C_LABEL, args}), do: Branching.label(args)

  def generate_instruction({:C_GOTO, args}), do: Branching.goto(args)

  def generate_instruction({:C_IF_GOTO, args}), do: Branching.if_goto(args)

  def generate_instruction(_instruction), do: ""
end
