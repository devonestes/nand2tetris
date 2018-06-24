defmodule Parser do
  def parse(commands, file_name) do
    commands
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn command -> parse_line(command, file_name) end)
  end

  defp parse_line("add", _), do: {:C_ADD, []}
  defp parse_line("sub", _), do: {:C_SUB, []}
  defp parse_line("pop" <> " " <> rest, file_name), do: {:C_POP, parse_segment(rest, file_name)}
  defp parse_line("push" <> " " <> rest, file_name), do: {:C_PUSH, parse_segment(rest, file_name)}
  defp parse_line(_, _), do: {:NOOP, []}

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
      [unquote(atom_name), String.to_integer(num), file_name]
    end
  end

  defp parse_segment(_, _), do: []
end
