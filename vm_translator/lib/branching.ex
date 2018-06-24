defmodule Branching do
  def label([label, file_name]) do
    """
    // label #{label} in #{file_name}
    (#{file_name}.#{label})
    """
  end

  def goto([label, file_name]) do
    """
    // goto #{label} in #{file_name}
    @#{file_name}.#{label}
    0;JMP
    """
  end

  def if_goto([label, file_name]) do
    """
    // if-goto #{label} in #{file_name}
    #{Helpers.pop_into_d_register()}
    @#{file_name}.#{label}
    D;JNE
    """
  end
end
