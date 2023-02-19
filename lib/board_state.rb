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

  def show
    line = ''
    @board.each_with_index do |y, y_index|
      y.each_with_index do |_x, x_index|
        line << "#{get_point(x_index, y_index) ? 'X' : '-'}\t"
      end
      line << "\n"
    end
    puts line
  end
end
