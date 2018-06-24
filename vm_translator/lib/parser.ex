defmodule Parser do
  def parse(commands) do
    commands
    |> String.split("\r\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line("add"), do: {:C_ADD, []}
  defp parse_line("sub"), do: {:C_SUB, []}
  defp parse_line("pop" <> " " <> rest), do: {:C_POP, parse_segment(rest)}
  defp parse_line("push" <> " " <> rest), do: {:C_PUSH, parse_segment(rest)}
  defp parse_line(_), do: {:NOOP, []}

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
    atom_name = segment_name |> String.upcase() |> String.to_atom

    defp parse_segment(unquote(segment_name) <> " " <> num) do
      [unquote(atom_name), String.to_integer(num)]
    end
  end

  defp parse_segment(_), do: []
end
