require './lib/board_state'

class WriterScript
  @location = './display_files'

  def self.write_points
    board = BoardState.new(4, 3)
    board.set_point(2, 1, true)
    File.write("#{@location}/0.txt", Marshal.dump(board))

    board = BoardState.new(4, 3)
    board.set_point(2, 1, false)
    board.set_point(1, 1, true)
    board.set_point(2, 2, true)
    File.write("#{@location}/1.txt", Marshal.dump(board))

    board = BoardState.new(4, 3, 4)
    board.set_point(0, 0, true)
    board.set_point(1, 1, true)
    File.write("#{@location}/2.txt", Marshal.dump(board))
  end
end
