require './lib/terminal_display'
require './lib/board_state'

RSpec.describe TerminalDisplay do
  let(:filepath) { './spec/tmp' }

  before do
    # Delete all files
    Dir[File.join(filepath, '*.txt')].each { |f| File.delete(f) }

    board = BoardState.new(2, 2)
    board.set_point(0, 0, true)
    File.write(File.join(filepath, '0.txt'), Marshal.dump(board))

    board.set_point(0, 1, true)
    File.write(File.join(filepath, '1.txt'), Marshal.dump(board))

    board.set_point(0, 0, false)
    board.set_point(1, 1, true)
    File.write(File.join(filepath, '11.txt'), Marshal.dump(board))

    board.set_point(0, 1, false)
    board.set_point(1, 0, true)
    File.write(File.join(filepath, '2.txt'), Marshal.dump(board))

    # These files should not be read
    File.write(File.join(filepath, 'foo.txt'), 'Foo')
    File.write(File.join(filepath, '3.md'), 'Bar')
  end

  it 'creates the correct matcher for the display files' do
    td = described_class.new(filepath)
    expect(td.display_files).to eq File.join(filepath, '*.txt')
  end

  it 'reads the correct display files from the filesystem on startup' do
    td = described_class.new(filepath)
    expect(td.states.length).to be 4
  end

  it 'reads the correct display files from the filesystem on re-read' do
    td = described_class.new(filepath)
    expect(td.states.length).to be 4

    # Re-read and ensure it doesn't just append states
    td.read_display_files
    expect(td.states.length).to be 4
  end

  it 'displays the correct state to the screen' do
    board = BoardState.new(2, 2)
    board.set_point(0, 0, true)

    td = described_class.new(filepath)
    read_board = td.states[0]

    expect(read_board.get_point(0, 0)).to be board.get_point(0, 0)
    expect(read_board.get_point(0, 1)).to be board.get_point(0, 1)
    expect(read_board.get_point(1, 0)).to be board.get_point(1, 0)
    expect(read_board.get_point(1, 1)).to be board.get_point(1, 1)
  end

  it 'displays the states in the correct order' do
    td = described_class.new(filepath)

    # First board (0.txt)
    board = BoardState.new(2, 2)
    board.set_point(0, 0, true)
    expect(td.states[0].get_point(0, 0)).to be board.get_point(0, 0)
    expect(td.states[0].get_point(0, 1)).to be board.get_point(0, 1)
    expect(td.states[0].get_point(1, 0)).to be board.get_point(1, 0)
    expect(td.states[0].get_point(1, 1)).to be board.get_point(1, 1)

    # Second board (1.txt)
    board = BoardState.new(2, 2)
    board.set_point(0, 0, true)
    board.set_point(0, 1, true)
    expect(td.states[1].get_point(0, 0)).to be board.get_point(0, 0)
    expect(td.states[1].get_point(0, 1)).to be board.get_point(0, 1)
    expect(td.states[1].get_point(1, 0)).to be board.get_point(1, 0)
    expect(td.states[1].get_point(1, 1)).to be board.get_point(1, 1)

    # First board (2.txt)
    board = BoardState.new(2, 2)
    board.set_point(1, 0, true)
    board.set_point(1, 1, true)
    expect(td.states[2].get_point(0, 0)).to be board.get_point(0, 0)
    expect(td.states[2].get_point(0, 1)).to be board.get_point(0, 1)
    expect(td.states[2].get_point(1, 0)).to be board.get_point(1, 0)
    expect(td.states[2].get_point(1, 1)).to be board.get_point(1, 1)

    # First board (11.txt)
    board = BoardState.new(2, 2)
    board.set_point(0, 1, true)
    board.set_point(1, 1, true)
    expect(td.states[3].get_point(0, 0)).to be board.get_point(0, 0)
    expect(td.states[3].get_point(0, 1)).to be board.get_point(0, 1)
    expect(td.states[3].get_point(1, 0)).to be board.get_point(1, 0)
    expect(td.states[3].get_point(1, 1)).to be board.get_point(1, 1)
  end

  # Cycle and re-read not yet implemented
  it 'reads the cycle speed from the filesystem'
  it 'cycles between different states'
end
