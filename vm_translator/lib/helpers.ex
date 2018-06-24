defmodule Helpers do
  def push_from_d_register() do
    "@SP\n#{dereference_pointer()}\nM=D\n#{increment_sp()}"
  end

  def pop_into_d_register() do
    "#{decrement_sp()}\n#{dereference_pointer()}\nD=M"
  end

  @cache_address "@R14"
  def cache_segment_address(), do: "D=A\n#{@cache_address}\nM=D"

  def store_d_register_in_cached_segment_address() do
    "#{@cache_address}\n#{dereference_pointer()}\nM=D"
  end

  def increment_sp(), do: "@SP\nM=M+1"

  def decrement_sp(), do: "@SP\nM=M-1"

  def dereference_pointer(), do: "A=M"

  def goto_segment_address(num), do: "D=M\n@#{num}\nA=D+A"
end
