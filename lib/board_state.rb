class BoardState
  attr_reader :board, :once

  def initialize(x_length = 1, y_length = 1, once: false)
    @once = once
    # Create board and default all cells to off
    @board = Array.new(y_length) { Array.new(x_length, false) }
  end

  def set_point(x_coord, y_coord, state)
    @board[y_coord][x_coord] = state
  end

  def get_point(x_coord, y_coord)
    @board[y_coord][x_coord]
  end

  def show
    line = ''
    @board.each do |y|
      y.each do |x|
        line << "#{x}\t"
      end
      line << "\n"
    end
    puts line
  end
end
