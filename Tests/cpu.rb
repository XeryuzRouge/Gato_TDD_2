require_relative '..\cpu'

require_relative '..\cpu'
require_relative 'tdd_classes'

RSpec.describe CPU do

  let(:opponent_cpu) { CPU.new(board, opponent) }
  let(:player_cpu) { CPU.new(board, player) }
  let(:board) { FakeBoard.new }
  let(:player) { "O" }
  let(:opponent) { "X" }

  it 'Should never lose' do
    turns = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    turns.each do |i|
      if (i%2) == 0
        opponent_cpu.move(i)
      else
        player_cpu.move(i)
      end
    end

    winner = board.check_for_winner(player) if board.check_for_winner(player) == player
    winner = board.check_for_winner(opponent) if board.check_for_winner(player) == opponent
    expect(winner).to eq nil
  end

end