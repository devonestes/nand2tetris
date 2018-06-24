defmodule Generator do
  def generate_code(ast) do
    ast
    |> Enum.map(&generate_instruction/1)
    |> Enum.join()
  end

  def generate_instruction({:C_ADD, _}) do
    """
    // add
    #{decrement_sp()}
    #{dereference_pointer()}
    D=M // D=M[257]
    #{decrement_sp()}
    #{dereference_pointer()}
    M=M+D // M[256]=M[256] + M[257]
    #{increment_sp()}
    """
  end

  def generate_instruction({:C_SUB, _}) do
    """
    // sub
    #{decrement_sp()}
    #{dereference_pointer()}
    D=M // D=M[257]
    #{decrement_sp()}
    #{dereference_pointer()}
    M=M-D // M[256]=M[256] - M[257]
    #{increment_sp()}
    """
  end

  def generate_instruction({:C_PUSH, [:CONSTANT, num]}) do
    """
    // push constant #{num}
    @#{num} // A=num
    D=A // D=num
    @SP
    #{dereference_pointer()}
    M=D // M[256]=num
    #{increment_sp()}
    """
  end

  def generate_instruction({:C_PUSH, [:TEMP, num]}) do
    """
    // push temp #{num}
    @#{num + 5} // A=temp num, M=contents of temp address
    D=M // D=contents of temp address
    #{push_from_d_register()}
    """
  end

  def generate_instruction({:C_PUSH, [:LOCAL, num]}) do
    """
    // push local #{num}
    @LCL // A=local pointer, M=local base address
    #{goto_segment_address(num)}
    D=M // D=contents of local address
    #{push_from_d_register()}
    """
  end

  def generate_instruction({:C_PUSH, [:ARGUMENT, num]}) do
    """
    // push argument #{num}
    @ARG // A=arg pointer, M=arg base address
    #{goto_segment_address(num)}
    D=M // D=contents of arg address
    #{push_from_d_register()}
    """
  end

  def generate_instruction({:C_PUSH, [:THIS, num]}) do
    """
    // push this #{num}
    @THIS // A=this pointer, M=this base address
    #{goto_segment_address(num)}
    D=M // D=contents of this address
    #{push_from_d_register()}
    """
  end

  def generate_instruction({:C_PUSH, [:THAT, num]}) do
    """
    // push that #{num}
    @THAT
    #{goto_segment_address(num)}
    D=M // D=contents of that address
    #{push_from_d_register()}
    """
  end

  def generate_instruction({:C_POP, [:TEMP, num]}) do
    """
    // pop temp #{num}
    #{pop_into_d_register()}
    @#{num + 5} // A=selected temp address, M=contents of selected temp address
    M=D // M[selected temp address]=popped data from d register
    """
  end

  def generate_instruction({:C_POP, [:LOCAL, num]}) do
    """
    // pop local #{num}
    @LCL
    #{goto_segment_address(num)}
    #{cache_segment_address()}
    #{pop_into_d_register()}
    #{store_d_register_in_cached_segment_address()}
    """
  end

  def generate_instruction({:C_POP, [:ARGUMENT, num]}) do
    """
    // pop argument #{num}
    @ARG
    #{goto_segment_address(num)}
    #{cache_segment_address()}
    #{pop_into_d_register()}
    #{store_d_register_in_cached_segment_address()}
    """
  end

  def generate_instruction({:C_POP, [:THIS, num]}) do
    """
    // pop this #{num}
    @THIS
    #{goto_segment_address(num)}
    #{cache_segment_address()}
    #{pop_into_d_register()}
    #{store_d_register_in_cached_segment_address()}
    """
  end

  def generate_instruction({:C_POP, [:THAT, num]}) do
    """
    // pop that #{num}
    @THAT
    #{goto_segment_address(num)}
    #{cache_segment_address()}
    #{pop_into_d_register()}
    #{store_d_register_in_cached_segment_address()}
    """
  end

  def generate_instruction(_instruction), do: ""

  defp push_from_d_register(), do: "@SP\n#{dereference_pointer()}\nM=D\n#{increment_sp()}"

  defp pop_into_d_register(), do: "#{decrement_sp()}\n#{dereference_pointer()}\nD=M"

  defp increment_sp(), do: "@SP\nM=M+1"

  defp decrement_sp(), do: "@SP\nM=M-1"

  defp dereference_pointer(), do: "A=M"

  defp goto_segment_address(num), do: "D=M\n@#{num}\nA=D+A"

  @cache_address "@R14"
  defp cache_segment_address(), do: "D=A\n#{@cache_address}\nM=D"

  defp store_d_register_in_cached_segment_address(), do: "#{@cache_address}\n#{dereference_pointer()}\nM=D"
end