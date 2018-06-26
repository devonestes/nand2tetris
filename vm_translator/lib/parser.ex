defmodule Parser do
  def parse(commands, file_name, call_counter_pid) do
    commands
    |> String.split("\r\n", trim: true)
    |> Enum.with_index()
    |> Enum.map(fn {command, line_no} ->
      parse_line(command, file_name, line_no, call_counter_pid)
    end)
  end

  defp parse_line("add" <> _, _, _, _), do: {:C_ADD, []}
  defp parse_line("sub" <> _, _, _, _), do: {:C_SUB, []}
  defp parse_line("neg" <> _, _, _, _), do: {:C_NEG, []}
  defp parse_line("and" <> _, _, _, _), do: {:C_AND, []}
  defp parse_line("or" <> _, _, _, _), do: {:C_OR, []}
  defp parse_line("not" <> _, _, _, _), do: {:C_NOT, []}
  defp parse_line("eq" <> _, _, line_no, _), do: {:C_EQ, [line_no]}
  defp parse_line("lt" <> _, _, line_no, _), do: {:C_LT, [line_no]}
  defp parse_line("gt" <> _, _, line_no, _), do: {:C_GT, [line_no]}

  defp parse_line("pop" <> " " <> rest, file_name, _, _) do
    {:C_POP, parse_segment(rest, file_name)}
  end

  defp parse_line("push" <> " " <> rest, file_name, _, _) do
    {:C_PUSH, parse_segment(rest, file_name)}
  end

  defp parse_line("goto" <> " " <> label, file_name, _, _) do
    [label] = Regex.run(~r/\w+/, label)
    {:C_GOTO, [label, file_name]}
  end

  defp parse_line("if-goto" <> " " <> label, file_name, _, _) do
    [label] = Regex.run(~r/\w+/, label)
    {:C_IF_GOTO, [label, file_name]}
  end

  defp parse_line("label" <> " " <> label, file_name, _, _) do
    [label] = Regex.run(~r/\w+/, label)
    {:C_LABEL, [label, file_name]}
  end

  defp parse_line("function" <> " " <> rest, _, _, _) do
    {:C_FUNCTION, parse_name_and_arity(rest)}
  end

  defp parse_line("call" <> " " <> rest, _, _, call_counter_pid) do
    [name, arity] = parse_name_and_arity(rest)

    call_count =
      Agent.get_and_update(call_counter_pid, fn call_counts ->
        function_name = "#{name}/#{arity}"
        current_count = Map.get(call_counts, function_name, 0)
        updated_call_counts = Map.put(call_counts, function_name, current_count + 1)
        {current_count, updated_call_counts}
      end)

    {:C_CALL, [name, arity, call_count]}
  end

  defp parse_line("return" <> _, _, _, _), do: {:C_RETURN, []}

  defp parse_line(_, _, _, _), do: {:NOOP, []}

  @valid_segments [
    "constant",
    "local",
    "argument",
    "this",
    "that",
    "temp",
    "pointer",
    "static"
  ]

  for segment_name <- @valid_segments do
    atom_name = segment_name |> String.upcase() |> String.to_atom()

    defp parse_segment(unquote(segment_name) <> " " <> num, file_name) do
      [num] = Regex.run(~r/\d+/, num)
      [unquote(atom_name), String.to_integer(num), file_name]
    end
  end

  defp parse_segment(_, _), do: []

  defp parse_name_and_arity(name_and_arity) do
    [name, arity] =
      name_and_arity
      |> String.split()
      |> Enum.take(2)

    [name, String.to_integer(arity)]
  end
end
