require 'filewatcher'
require './lib/terminal_display'

class TerminalScript
  def initialize
    # Startup - create object, load and display
    @td = TerminalDisplay.new
    Thread.new { filewatch_loop }
    output = Thread.new { output_loop }
    output.join
  end

  private

  def output_loop
    loop do
      @td.output
      break unless @td.loop
    end
  end

  def filewatch_loop
    Filewatcher.new(@td.display_files).watch do
      @td.read_display_files
    end
  end
end
