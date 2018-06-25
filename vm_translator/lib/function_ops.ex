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
    """
    // call #{name} #{arity} number #{call_no}

    // push return address using label declared below
    // push LCL pointer
    // push ARG pointer
    // push THIS pointer
    // push THAT pointer
    // reposition ARG (SP - 5 - arity)
    // goto #{name}
    // set return location with label including call number
    """
  end

  def return() do
    """
    // return

    // Store pointer to LCL in R14 (call this EndFrame)
    @LCL
    D=M
    @R14
    M=D

    // Store pointer to return address in R15 (call this RetAddress)
    @5
    D=D-A
    @R15
    M=D

    // move return value for caller
    #{Helpers.pop_into_d_register()}
    @ARG
    #{Helpers.dereference_pointer()}
    M=D

    // reposition SP for caller (SP = ARG + 1)
    @ARG
    D=M+1
    @SP
    M=D

    // THAT = *(EndFrame - 1)
    @1
    D=A
    @R14
    A=M-D
    D=M
    @THAT
    M=D

    // THIS = *(EndFrame - 2)
    @2
    D=A
    @R14
    A=M-D
    D=M
    @THIS
    M=D

    // ARG = *(EndFrame - 3)
    @3
    D=A
    @R14
    A=M-D
    D=M
    @ARG
    M=D

    // LCL = *(EndFrame - 4)
    @4
    D=A
    @R14
    A=M-D
    D=M
    @LCL
    M=D

    // goto RetAddress
    @R15
    A=M
    0;JMP
    """
  end
end
