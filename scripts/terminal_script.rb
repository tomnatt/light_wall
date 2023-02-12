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
    loop do
      sleep 1

      # Check for change
      # next unless @td.display_files_changed?

      # @td.read_display_files
      @td.output
    end
  end
end
