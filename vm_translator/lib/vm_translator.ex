defmodule VmTranslator do
  def translate(file_name) do
    output =
      file_name
      |> Path.expand()
      |> File.read()
      |> Parser.parse()
      |> Generator.generate_code()

    :ok =
      file_name
      |> Path.expand()
      |> String.replace_suffix(".vm", ".asm")
      |> File.write!(output)
  end
end
