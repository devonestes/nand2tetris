defmodule Push do
  def push([:CONSTANT, num, _]) do
    """
    // push constant #{num}
    @#{num}
    D=A
    @SP
    #{Helpers.dereference_pointer()}
    M=D
    #{Helpers.increment_sp()}
    """
  end

  def push([:TEMP, num, _]) do
    """
    // push temp #{num}
    @#{num + 5}
    D=M
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:LOCAL, num, _]) do
    """
    // push local #{num}
    @LCL
    #{Helpers.goto_segment_address(num)}
    D=M
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:ARGUMENT, num, _]) do
    """
    // push argument #{num}
    @ARG
    #{Helpers.goto_segment_address(num)}
    D=M
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:THIS, num, _]) do
    """
    // push this #{num}
    @THIS
    #{Helpers.goto_segment_address(num)}
    D=M
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:THAT, num, _]) do
    """
    // push that #{num}
    @THAT
    #{Helpers.goto_segment_address(num)}
    D=M
    #{Helpers.push_from_d_register()}
    """
  end

  def push([:POINTER, 0, _]) do
    """
    // push pointer 0
    @THIS
    D=M
    @SP
    #{Helpers.dereference_pointer()}
    M=D
    #{Helpers.increment_sp()}
    """
  end

  def push([:POINTER, 1, _]) do
    """
    // push pointer 1
    @THAT
    D=M
    @SP
    #{Helpers.dereference_pointer()}
    M=D
    #{Helpers.increment_sp()}
    """
  end

  def push([:STATIC, num, file_name]) do
    """
    // push static #{num} from #{file_name}
    @#{file_name}.#{num}
    D=M
    @SP
    #{Helpers.dereference_pointer()}
    M=D
    #{Helpers.increment_sp()}
    """
  end
end
