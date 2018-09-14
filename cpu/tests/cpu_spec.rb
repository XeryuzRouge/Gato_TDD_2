
require_relative '..\cpu'
require_relative 'tdd_classes'

RSpec.describe CPU do

  it 'Should never lose' do
      board = FakeBoard.new
      player = "O" 
      opponent = "X"
      opponent_cpu = CPU.new(board, opponent)
      player_cpu = CPU.new(board, player)
    turns = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    turns.each do |i|
        if (i%2) == 0
          opponent_cpu.move(i)
        else
          player_cpu.move(i)
        end
      end

      winner = board.check_for_winner(player) if board.check_for_winner(player) == player
      winner = board.check_for_winner(opponent) if board.check_for_winner(opponent) == opponent
      print "#{board.winning_combos}\n "
      expect(winner).to eq "Tie"
    end
  end

end