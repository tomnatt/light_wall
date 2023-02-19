require 'filewatcher'
require './lib/terminal_display'

class TerminalScript
  def initialize
    # Startup - create object, load and display
    @td = TerminalDisplay.new
    @td.output

    loop_start
  end

  private

  def loop_start
    Filewatcher.new(@td.display_files).watch do
      @td.read_display_files
      @td.output
    end
  end
end
