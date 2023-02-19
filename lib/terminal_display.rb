require './lib/board_state'

class TerminalDisplay
  attr_reader :states, :display_files

  def initialize(path_to_display_files = './display_files')
    @path_to_display_files = path_to_display_files
    @display_files = File.join(@path_to_display_files, '*.txt')
    @states = []
    read_display_files
  end

  def output
    @states.each do |s|
      display(s)
      puts "\n"
    end
  end

  def read_display_files
    # Read directory looking for files with correct extension
    filenames = []
    Dir[@display_files].each do |f|
      # Only keep files named 0.txt, 1.txt, etc - cast to ints
      filenames << File.basename(f, '.txt').to_i unless (File.basename(f, '.txt') =~ /^\d+$/).nil?
    end

    # Reset states
    @states = []

    # Sort so files are in ascending order then read contents
    filenames.sort.each do |f|
      file = File.join(@path_to_display_files, "#{f}.txt")
      @states << Marshal.load(File.read(file))
    end
  end

  private

  def display(board_state)
    line = ''
    board_state.board.each_with_index do |y, y_index|
      y.each_with_index do |_x, x_index|
        line << "#{board_state.get_point(x_index, y_index) ? 'X' : '-'}\t"
      end
      line << "\n"
    end
    puts line
  end
end
