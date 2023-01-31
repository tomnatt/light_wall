require './lib/board_state'

RSpec.describe BoardState do
  it 'defaults to correct size and display_cycle state' do
    test_board = described_class.new
    expect(test_board.board.length).to be 1
    expect(test_board.board[0].length).to be 1
    # expect(test_board.display_cycle).to be false
  end

  it 'is of specified size' do
    test_board = described_class.new(3, 2)
    # Test the x length
    expect(test_board.board[0].length).to be 3
    # Test the y length
    expect(test_board.board.length).to be 2
  end

  it 'has all cells set to false' do
    test_board = described_class.new(3, 2)
    3.times.each do |x|
      2.times.each do |y|
        expect(test_board.board[y][x]).to be false
      end
    end
  end

  it 'changes state of an individual point' do
    test_board = described_class.new
    expect(test_board.board[0][0]).to be false

    test_board.set_point(0, 0, true)
    expect(test_board.board[0][0]).to be true
  end

  it 'gets the state of a single point' do
    test_board = described_class.new
    expect(test_board.board[0][0]).to be false
    expect(test_board.get_point(0, 0)).to be false

    test_board.set_point(0, 0, true)
    expect(test_board.board[0][0]).to be true
    expect(test_board.get_point(0, 0)).to be true
  end

  it 'changes state of an individual point without changing other points' do
    test_board = described_class.new(3, 4)
    test_board.set_point(1, 2, true)

    3.times.each do |x|
      4.times.each do |y|
        if x == 1 && y == 2
          expect(test_board.get_point(x, y)).to be true
        else
          expect(test_board.get_point(x, y)).to be false
        end
      end
    end
  end
end
