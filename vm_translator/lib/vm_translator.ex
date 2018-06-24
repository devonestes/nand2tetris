defmodule VmTranslator do
  def translate(file_name) do
    expanded_file_name = Path.expand(file_name)
    file_name = Path.basename(file_name, ".vm")

    output =
      expanded_file_name
      |> File.read!()
      |> Parser.parse(file_name)
      |> Generator.generate_code()

    expanded_file_name
    |> String.replace_suffix(".vm", ".asm")
    |> File.write!(output)
  end
end
