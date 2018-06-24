defmodule Parser do
  def parse({:ok, commands}) do
    commands
    |> String.split("\r\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line("add"), do: {:C_ADD, []}
  defp parse_line("sub"), do: {:C_SUB, []}
  defp parse_line("pop" <> " " <> rest), do: {:C_POP, parse_segment(rest)}
  defp parse_line("push" <> " " <> rest), do: {:C_PUSH, parse_segment(rest)}
  defp parse_line(_), do: {:NOOP, []}

  defp parse_segment("constant" <> " " <> num), do: [:CONSTANT, String.to_integer(num)]
  defp parse_segment("local" <> " " <> num), do: [:LOCAL, String.to_integer(num)]
  defp parse_segment("argument" <> " " <> num), do: [:ARGUMENT, String.to_integer(num)]
  defp parse_segment("this" <> " " <> num), do: [:THIS, String.to_integer(num)]
  defp parse_segment("that" <> " " <> num), do: [:THAT, String.to_integer(num)]
  defp parse_segment("temp" <> " " <> num), do: [:TEMP, String.to_integer(num)]
  defp parse_segment(_), do: []
end
