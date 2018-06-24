defmodule Push do
  def push([:CONSTANT, num, _]) do
    """
    // push constant #{num}
    @#{num} // A=num
    D=A // D=num
    @SP
    #{Helpers.dereference_pointer()}
    M=D // M[256]=num
    #{Helpers.increment_sp()}
    """
  end

  def push([:TEMP, num, _]) do
    """
    // push temp #{num}
    @#{num + 5} // A=temp num, M=contents of temp address
    D=M // D=contents of temp address
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:LOCAL, num, _]) do
    """
    // push local #{num}
    @LCL // A=local pointer, M=local base address
    #{Helpers.goto_segment_address(num)}
    D=M // D=contents of local address
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:ARGUMENT, num, _]) do
    """
    // push argument #{num}
    @ARG // A=arg pointer, M=arg base address
    #{Helpers.goto_segment_address(num)}
    D=M // D=contents of arg address
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:THIS, num, _]) do
    """
    // push this #{num}
    @THIS // A=this pointer, M=this base address
    #{Helpers.goto_segment_address(num)}
    D=M // D=contents of this address
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:THAT, num, _]) do
    """
    // push that #{num}
    @THAT
    #{Helpers.goto_segment_address(num)}
    D=M // D=contents of that address
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:POINTER, 0, _]) do
    """
    @THIS
    D=M // Set pointer for THIS to D register
    @SP
    #{Helpers.dereference_pointer()}
    M=D // Add pointer to THIS to top of stack
    #{Helpers.increment_sp()}
    """
  end

  def push([:POINTER, 1, _]) do
    """
    @THAT
    D=M // Set pointer for THAT to D register
    @SP
    #{Helpers.dereference_pointer()}
    M=D // Add pointer to THAT to top of stack
    #{Helpers.increment_sp()}
    """
  end

  def push([:STATIC, num, file_name]) do
    """
    // push static #{num} from #{file_name}
    @#{file_name}.#{num}
    D=M // Load value from that static address to D register
    @SP
    #{Helpers.dereference_pointer()}
    M=D
    #{Helpers.increment_sp()}
    """
  end
end
