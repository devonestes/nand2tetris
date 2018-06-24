defmodule Mix.Tasks.VmTranslator.Translate do
  use Mix.Task

  @shortdoc "Translates a given *.vm file to a *.asm file"
  def run([file_name]) do
    VmTranslator.translate(file_name)
  end
end
