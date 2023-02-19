class BoardState
  attr_reader :board, :display_time

  def initialize(x_length = 1, y_length = 1, display_time = 1)
    # Create board and default all cells to off
    @board = Array.new(y_length) { Array.new(x_length, false) }
    @display_time = display_time
  end

  def set_point(x_coord, y_coord, state)
    @board[y_coord][x_coord] = state
  end

  def get_point(x_coord, y_coord)
    @board[y_coord][x_coord]
  end
end
