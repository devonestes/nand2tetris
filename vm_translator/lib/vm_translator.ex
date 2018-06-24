defmodule VmTranslator do
  def translate(file_name) do
    expanded_file_name = Path.expand(file_name)

    output =
      expanded_file_name
      |> File.read!()
      |> Parser.parse()
      |> Generator.generate_code()

    expanded_file_name
    |> String.replace_suffix(".vm", ".asm")
    |> File.write!(output)
  end
end
