require './lib/terminal_display'

task :default do
  puts 'Not yet implemented'
end

desc 'Write a fixed state to file'
task :writer do
  require './lib/board_state'

  board = BoardState.new(4, 3)
  board.set_point(2, 1, true)

  # TODO: Obviously needs work here
  location = './display_files'
  File.write("#{location}/foo.txt", Marshal.dump(board))
end

# task :display do
#   td = TerminalDisplay.new
#   td.output
# end

# task :run_display do
#   puts 'Run up writer and display'
# end
