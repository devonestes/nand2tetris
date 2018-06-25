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
    D=D-M
    @SP
    #{Helpers.dereference_pointer()}
    M=-1
    @CONTINUE#{command_num}
    D;JEQ
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
    D=D-M
    @SP
    #{Helpers.dereference_pointer()}
    M=-1
    @CONTINUE#{command_num}
    D;JGT
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
    D=D-M
    @SP
    #{Helpers.dereference_pointer()}
    M=-1
    @CONTINUE#{command_num}
    D;JLT
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
