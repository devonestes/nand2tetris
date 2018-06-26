defmodule FunctionOps do
  def function([name, num_local_vars]) do
    local_vars =
      0..num_local_vars
      |> Enum.take(num_local_vars)
      |> Enum.map(fn _ -> "D=0\n#{Helpers.push_from_d_register()}\n" end)
      |> Enum.join()

    """
    // function #{name} #{num_local_vars}
    (#{name})
    #{local_vars}
    """
  end

  def call([name, arity, call_no]) do
    call_address = "#{name}$ret.#{call_no}"
    """
    // call #{name} #{arity} number #{call_no}

    // push return address using label declared below
    @#{call_address}
    D=A
    #{Helpers.push_from_d_register}

    // push LCL pointer
    @LCL
    D=M
    #{Helpers.push_from_d_register}

    // push ARG pointer
    @ARG
    D=M
    #{Helpers.push_from_d_register}

    // push THIS pointer
    @THIS
    D=M
    #{Helpers.push_from_d_register}

    // push THAT pointer
    @THAT
    D=M
    #{Helpers.push_from_d_register}

    // reposition ARG (SP - (5 + arity))
    @#{arity + 5}
    D=A
    @SP
    D=M-D
    @ARG
    M=D

    // reposition LCL = SP
    @SP
    D=M
    @LCL
    M=D

    // goto #{name}
    @#{name}
    0;JMP

    // set return location with label including call number
    (#{call_address})
    """
  end

  @endframe_cache_key "@R14"
  @return_address_cache_key "@R15"
  def return() do
    """
    // return
    @LCL
    D=M
    #{@endframe_cache_key}
    M=D
    @5
    D=D-A
    #{@return_address_cache_key}
    M=D
    #{Helpers.pop_into_d_register()}
    @ARG
    #{Helpers.dereference_pointer()}
    M=D
    @ARG
    D=M+1
    @SP
    M=D
    #{subtract_from_endframe(1)}
    @THAT
    M=D
    #{subtract_from_endframe(2)}
    @THIS
    M=D
    #{subtract_from_endframe(3)}
    @ARG
    M=D
    #{subtract_from_endframe(4)}
    @LCL
    M=D
    #{@return_address_cache_key}
    A=M
    0;JMP
    """
  end

  defp subtract_from_endframe(num) do
    "@#{num}\nD=A\n#{@endframe_cache_key}\nA=M-D\nD=M"
  end
end
