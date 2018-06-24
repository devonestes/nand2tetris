defmodule BooleanOps do
  @moduledoc """
  All these functions are prefixed with `_` to avoid name collisions with
  Elixir built ins (like not).
  """

  def _eq(command_num) do
    """
    // eq
    #{Helpers.pop_into_d_register()}
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=D-M // If the two values are equal, D will equal 0.
    @SP // A=0, M=266
    #{Helpers.dereference_pointer()}
    M=-1
    @CONTINUE#{command_num} // Load sequence number of continue
    D;JEQ // Jump there if the two values were equal
    @SP
    #{Helpers.dereference_pointer()}
    M=0
    (CONTINUE#{command_num})
    #{Helpers.increment_sp()}
    """
  end

  def _lt(command_num) do
    """
    // lt
    #{Helpers.pop_into_d_register()}
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=D-M // If D was less than M, D will be negative
    @SP
    #{Helpers.dereference_pointer()}
    M=-1
    @CONTINUE#{command_num} // Load sequence number of continue
    D;JGT // Jump the false branch if D was less than M
    @SP
    #{Helpers.dereference_pointer()}
    M=0
    (CONTINUE#{command_num})
    #{Helpers.increment_sp()}
    """
  end

  def _gt(command_num) do
    """
    // gt
    #{Helpers.pop_into_d_register()}
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    D=D-M // If D was greater than M, D will be positive
    @SP
    #{Helpers.dereference_pointer()}
    M=-1
    @CONTINUE#{command_num} // Load sequence number of continue
    D;JLT // Jump the false branch if D was greater than
    @SP
    #{Helpers.dereference_pointer()}
    M=0
    (CONTINUE#{command_num})
    #{Helpers.increment_sp()}
    """
  end

  def _neg() do
    """
    // neg
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=-M
    #{Helpers.increment_sp()}
    """
  end

  def _not() do
    """
    // not
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=!M
    #{Helpers.increment_sp()}
    """
  end

  def _and() do
    """
    // and
    #{Helpers.pop_into_d_register()}
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=D&M
    #{Helpers.increment_sp()}
    """
  end

  def _or() do
    """
    // or
    #{Helpers.pop_into_d_register()}
    #{Helpers.decrement_sp()}
    #{Helpers.dereference_pointer()}
    M=D|M
    #{Helpers.increment_sp()}
    """
  end
end
