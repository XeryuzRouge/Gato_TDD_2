
require_relative '..\board_analyzer'
require_relative '..\..\tests\tdd_classes'

RSpec.describe BoardAnalyzer do

  let(:board_analyzer) { BoardAnalyzer.new }
  let(:board) { FakeBoard.new }
  let(:player) { "O" }
  let(:opponent) { "X" }


  it 'Should give a box in the board for blocking a winning play from the opponent' do
    board.play_on_box("5", opponent)
    board.play_on_box("7", player)
    board.play_on_box("4", opponent)

    expect(board_analyzer.analyze(board, player)).to eq 6
  end

  it 'Should give the winning box for the player' do
    board.play_on_box("5", player)
    board.play_on_box("7", opponent)
    board.play_on_box("1", player)
    board.play_on_box("4", opponent)

    expect(board_analyzer.analyze(board, player)).to eq 9
  end

  it 'Should prioritize the winning box over the block box' do
    board.play_on_box("5", player)
    board.play_on_box("7", opponent)
    board.play_on_box("4", player)
    board.play_on_box("8", opponent)

    expect(board_analyzer.analyze(board, player)).to eq 6
  end

  it "Should return null if there isn't a blocking or winning box option" do
    board.play_on_box("5", player)
    board.play_on_box("7", opponent)

    expect(board_analyzer.analyze(board, player)).to eq nil
  end

end