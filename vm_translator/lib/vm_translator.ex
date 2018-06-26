defmodule VmTranslator do
  def translate(file_or_dir_name) do
    {:ok, call_counter_pid} = Agent.start_link(fn -> %{} end)
    expanded_path = Path.expand(file_or_dir_name)

    {output, output_file_name} =
      if File.dir?(file_or_dir_name) do
        output =
          "#{expanded_path}/**/*.vm"
          |> Path.wildcard()
          |> Enum.map(fn file_name ->
            translate_file(file_name, call_counter_pid)
          end)
          |> Enum.join("\n")

        file_basename = Path.basename(expanded_path)
        output_file_name = "#{expanded_path}/#{file_basename}.asm"

        {output, output_file_name}
      else
        output = translate_file(expanded_path, call_counter_pid)
        output_file_name = String.replace_suffix(expanded_path, ".vm", ".asm")
        {output, output_file_name}
      end

    Agent.stop(call_counter_pid)

    output = prepend_boodstrap_assembly(output)

    File.write!(output_file_name, output)
  end

  defp translate_file(file_name, call_counter_pid) do
    file_basename = Path.basename(file_name, ".vm")

    file_name
    |> File.read!()
    |> Parser.parse(file_basename, call_counter_pid)
    |> Generator.generate_code()
  end

  defp prepend_boodstrap_assembly(output) do
    """
    // bootstrap
    @256
    D=A
    @SP
    M=D
    @Sys.init
    0;JMP
    #{output}
    """
  end
end
