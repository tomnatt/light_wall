require './lib/board_state'

board = BoardState.new(4, 3)
board.set_point(2, 1, true)
board.show
