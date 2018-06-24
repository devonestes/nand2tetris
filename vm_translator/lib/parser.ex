defmodule Parser do
  def parse(commands, file_name) do
    commands
    |> String.split("\r\n", trim: true)
    |> Enum.with_index()
    |> Enum.map(fn {command, line_no} ->
      parse_line(command, file_name, line_no)
    end)
  end

  defp parse_line("add", _, _), do: {:C_ADD, []}
  defp parse_line("sub", _, _), do: {:C_SUB, []}
  defp parse_line("neg", _, _), do: {:C_NEG, []}
  defp parse_line("and", _, _), do: {:C_AND, []}
  defp parse_line("or", _, _), do: {:C_OR, []}
  defp parse_line("not", _, _), do: {:C_NOT, []}
  defp parse_line("eq", _, line_no), do: {:C_EQ, [line_no]}
  defp parse_line("lt", _, line_no), do: {:C_LT, [line_no]}
  defp parse_line("gt", _, line_no), do: {:C_GT, [line_no]}

  defp parse_line("pop" <> " " <> rest, file_name, _) do
    {:C_POP, parse_segment(rest, file_name)}
  end

  defp parse_line("push" <> " " <> rest, file_name, _) do
    {:C_PUSH, parse_segment(rest, file_name)}
  end

  defp parse_line("goto" <> " " <> label, file_name, _) do
    [label] = Regex.run(~r/\w+/, label)
    {:C_GOTO, [label, file_name]}
  end

  defp parse_line("if-goto" <> " " <> label, file_name, _) do
    [label] = Regex.run(~r/\w+/, label)
    {:C_IF_GOTO, [label, file_name]}
  end

  defp parse_line("label" <> " " <> label, file_name, _) do
    [label] = Regex.run(~r/\w+/, label)
    {:C_LABEL, [label, file_name]}
  end

  defp parse_line(_, _, _), do: {:NOOP, []}

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
end
