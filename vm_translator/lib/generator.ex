defmodule Generator do
  def generate_code(ast) do
    ast
    |> Enum.map(&generate_instruction/1)
    |> Enum.join()
  end

  defp generate_instruction({:C_ADD, _}) do
    """
    // add
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=M
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=M+D
    #{Helpers.increment_sp()}
    """
  end

  defp generate_instruction({:C_SUB, _}) do
    """
    // sub
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=M
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=M-D
    #{Helpers.increment_sp()}
    """
  end

  defp generate_instruction({:C_EQ, [command_num]}), do: BooleanOps._eq(command_num)

  defp generate_instruction({:C_LT, [command_num]}), do: BooleanOps._lt(command_num)

  defp generate_instruction({:C_GT, [command_num]}), do: BooleanOps._gt(command_num)

  defp generate_instruction({:C_NEG, _}), do: BooleanOps._neg()

  defp generate_instruction({:C_NOT, _}), do: BooleanOps._not()

  defp generate_instruction({:C_AND, _}), do: BooleanOps._and()

  defp generate_instruction({:C_OR, _}), do: BooleanOps._or()

  defp generate_instruction({:C_PUSH, args}), do: Push.push(args)

  defp generate_instruction({:C_POP, args}), do: Pop.pop(args)

  defp generate_instruction({:C_LABEL, args}), do: Branching.label(args)

  defp generate_instruction({:C_GOTO, args}), do: Branching.goto(args)

  defp generate_instruction({:C_IF_GOTO, args}), do: Branching.if_goto(args)

  defp generate_instruction({:C_CALL, args}), do: FunctionOps.call(args)

  defp generate_instruction({:C_FUNCTION, args}), do: FunctionOps.function(args)

  defp generate_instruction({:C_RETURN, _}), do: FunctionOps.return()

  defp generate_instruction(_instruction), do: ""
end
