defmodule Pop do
  def pop([:TEMP, num, _]) do
    """
    // pop temp #{num}
    #{Helpers.pop_into_d_register()}
    @#{num + 5} // A=selected temp address, M=contents of selected temp address
    M=D // M[selected temp address]=popped data from d register
    """
  end

  def pop([:LOCAL, num, _]) do
    """
    // pop local #{num}
    @LCL
    #{Helpers.goto_segment_address(num)}
    #{Helpers.cache_segment_address()}
    #{Helpers.pop_into_d_register()}
    #{Helpers.store_d_register_in_cached_segment_address()}
    """
  end

  def pop([:ARGUMENT, num, _]) do
    """
    // pop argument #{num}
    @ARG
    #{Helpers.goto_segment_address(num)}
    #{Helpers.cache_segment_address()}
    #{Helpers.pop_into_d_register()}
    #{Helpers.store_d_register_in_cached_segment_address()}
    """
  end

  def pop([:THIS, num, _]) do
    """
    // pop this #{num}
    @THIS
    #{Helpers.goto_segment_address(num)}
    #{Helpers.cache_segment_address()}
    #{Helpers.pop_into_d_register()}
    #{Helpers.store_d_register_in_cached_segment_address()}
    """
  end

  def pop([:THAT, num, _]) do
    """
    // pop that #{num}
    @THAT
    #{Helpers.goto_segment_address(num)}
    #{Helpers.cache_segment_address()}
    #{Helpers.pop_into_d_register()}
    #{Helpers.store_d_register_in_cached_segment_address()}
    """
  end

  def pop([:POINTER, 0, _]) do
    """
    #{Helpers.pop_into_d_register()}
    @THIS // Load pointer in A register
    M=D // Change pointer address to poped value
    """
  end

  def pop([:POINTER, 1, _]) do
    """
    #{Helpers.pop_into_d_register()}
    @THAT // Load pointer in A register
    M=D // Change pointer address to poped value
    """
  end

  def pop([:STATIC, num, file_name]) do
    """
    // pop static #{num} from #{file_name}
    #{Helpers.pop_into_d_register()}
    @#{file_name}.#{num}
    M=D
    """
  end
end
