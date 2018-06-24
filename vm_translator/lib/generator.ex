defmodule Generator do
  def generate_code(ast) do
    ast
    |> Enum.map(&generate_instruction/1)
    |> Enum.join()
  end

  def generate_instruction({:C_ADD, _}) do
    """
    // add
    @SP // A=0, M=258
    M=M-1 // M=257
    A=M // A=257, M=contents of 257 (top element in stack)
    D=M // D=contents of 257 (top element in stack)
    @SP // A=0, M=257
    M=M-1 // A=H, M=256
    A=M // A=256, M=contents of 256 (second element in stack)
    M=M+D // 256=contents of 256 + contents of 257 (sum of top values)
    @SP // A=0, M=256
    M=M+1 // M=257
    """
  end

  def generate_instruction({:C_SUB, _}) do
    """
    // sub
    @SP // A=0, M=258
    M=M-1 // A=0, M=257
    A=M // A=257, M=contents of 257 (top element in stack)
    D=M // D=contents of 257 (top element in stack)
    @SP // A=0, M=257
    M=M-1 // M[0]=256
    A=M // A=256, M=contents of 256 (second element in stack)
    M=M-D // M[256]=contents of 256 - contents of 257 (difference of top values)
    @SP // A=0, M[0]=256
    M=M+1 // A=0, M[0]=257
    """
  end

  def generate_instruction({:C_PUSH, [:CONSTANT, num]}) do
    """
    // push constant #{num}
    @#{num} // A=num
    D=A // D=num
    @SP // A=0, M=256
    A=M // A=256, M=*256
    M=D // *256=num
    @SP // A=0, M=256
    M=M+1 // M=257
    """
  end

  def generate_instruction({:C_PUSH, [:TEMP, num]}) do
    """
    // push temp #{num}
    @#{num + 5} // A=temp num, M=contents of temp address
    D=M // D=contents of temp address
    @SP // A=0, M=256
    A=M // A=256, M=contents of 256
    M=D // 256=contents of temp address
    @SP // A=0, M=256
    M=M+1 // A=0, M=257
    """
  end

  def generate_instruction({:C_PUSH, [:LOCAL, num]}) do
    """
    // push local #{num}
    @LCL // A=local pointer, M=local base address
    D=M // D=local base address
    @#{num} // A=local offset, M=?
    A=D+A // A=local base address + local offset, M=contents of local 2 or whatever
    D=M // D=contents of local address
    @SP // A=0, M=256
    A=M // A=256, M=contents of 256
    M=D // M=contents of local address
    @SP // A=0, M=256
    M=M+1 // A=0, M=257
    """
  end

  def generate_instruction({:C_PUSH, [:ARGUMENT, num]}) do
    """
    // push argument #{num}
    @ARG // A=arg pointer, M=arg base address
    D=M // D=arg base address
    @#{num} // A=arg offset, M=?
    A=D+A // A=arg base address + arg offset, M=contents of arg 2 or whatever
    D=M // D=contents of arg address
    @SP // A=0, M=256
    A=M // A=256, M=contents of 256
    M=D // 256=contents of arg address
    @SP // A=0, M=256
    M=M+1 // A=0, M=257
    """
  end

  def generate_instruction({:C_PUSH, [:THIS, num]}) do
    """
    // push this #{num}
    @THIS // A=this pointer, M=this base address
    D=M // D=this base address
    @#{num} // A=this offset, M=?
    A=D+A // A=this base + offset, M=contents of selected address
    D=M // D=contents of selected this address
    @SP // A=0, M=256
    A=M // A=256, M=contents of 256
    M=D // 256=contents of selected this address
    @SP // A=0, M=256
    M=M+1 // M=257
    """
  end

  def generate_instruction({:C_PUSH, [:THAT, num]}) do
    """
    // push that #{num}
    @THAT
    D=M
    @#{num}
    A=D+A
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    """
  end

  def generate_instruction({:C_POP, [:TEMP, num]}) do
    """
    // pop temp #{num}
    @SP // A=0, M=256
    M=M-1 // A=0, M=255
    A=M // A=255, M=contents of 255
    D=M // D=contents of 255
    @#{num + 5} // A=selected temp address, M=contents of selected temp address
    M=D // M=contents of 255
    """
  end

  def generate_instruction({:C_POP, [:LOCAL, num]}) do
    """
    // pop local #{num}
    @SP // A=0, M=256
    M=M-1 // A=0, M=255
    A=M // A=255, M=contents of 255 (top of stack)
    D=M // D=popped value
    @R13 // A=13, M=contents of R13
    M=D // A=13, M=popped value
    @#{num} // A=local offset, M=?
    D=A // D=local offset
    @LCL // A=local pointer, M=local base address
    D=D+M // D=local base address + local offset (address where the popped value in R13 is going)
    @R14 // A=14, M=contents of R14
    M=D // M=selected local address
    @R13 // A=13, M=contents of R13 (popped value)
    D=M // D=popped value
    @R14 // A=14, M=selected local address
    A=M // A=selected local address
    M=D // M=popped value
    """
  end

  def generate_instruction({:C_POP, [:ARGUMENT, num]}) do
    """
    // pop argument #{num}
    @SP // A=0, M=256
    M=M-1 // A=0, M=255
    A=M // A=255, M=contents of 255 (top of stack)
    D=M // D=popped value
    @R13 // A=13, M=contents of R13
    M=D // A=13, M=popped value
    @#{num} // A=local offset, M=?
    D=A // D=local offset
    @ARG // A=arg pointer, M=arg base address
    D=D+M // D=arg base address + arg offset (address where the popped value in R13 is going)
    @R14 // A=14, M=contents of R14
    M=D // M=selected arg address
    @R13 // A=13, M=contents of R13 (popped value)
    D=M // D=popped value
    @R14 // A=14, M=selected arg address
    A=M // A=selected arg address
    M=D // M=popped value
    """
  end

  def generate_instruction({:C_POP, [:THIS, num]}) do
    """
    // pop this #{num}
    @SP // A=0, M=256
    M=M-1 // A=0, M=255
    A=M // A=255, M=contents of 255 (top of stack)
    D=M // D=popped value
    @R13 // A=13, M=contents of R13
    M=D // A=13, M=popped value
    @#{num} // A=local offset, M=?
    D=A // D=local offset
    @THIS // A=this pointer, M=this base address
    D=D+M // D=this base address + this offset (address where the popped value in R13 is going)
    @R14 // A=14, M=contents of R14
    M=D // M=selected this address
    @R13 // A=13, M=contents of R13 (popped value)
    D=M // D=popped value
    @R14 // A=14, M=selected this address
    A=M // A=selected this address
    M=D // M=popped value
    """
  end

  def generate_instruction({:C_POP, [:THAT, num]}) do
    """
    // pop that #{num}
    @SP // A=0, M=256
    M=M-1 // A=0, M=255
    A=M // A=255, M=contents of 255 (top of stack)
    D=M // D=popped value
    @R13 // A=13, M=contents of R13
    M=D // A=13, M=popped value
    @#{num} // A=local offset, M=?
    D=A // D=local offset
    @THAT // A=that pointer, M=that base address
    D=D+M // D=that base address + that offset (address where the popped value in R13 is going)
    @R14 // A=14, M=contents of R14
    M=D // M=selected that address
    @R13 // A=13, M=contents of R13 (popped value)
    D=M // D=popped value
    @R14 // A=14, M=selected that address
    A=M // A=selected that address
    M=D // M=popped value
    """
  end

  def generate_instruction(_instruction), do: ""
end
