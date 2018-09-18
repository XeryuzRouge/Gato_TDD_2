
require_relative '..\cpu_input'
require_relative '..\..\tests\tdd_classes'

RSpec.describe CPUInput do

  a = Array.new(30)

  a.each do

    it 'should never lose' do
      board = FakeBoard.new
      player1 = "X" 
      player2 = "O"
      plays_recorder = {}

      opponent_cpu = CPUInput.new(board)
      turns = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      turns.each do |i|
        if (i%2) == 0
        choice = opponent_cpu.move(player2, i)
        else
        choice = board.play_on_box(board.available_boxes.sample, player1)
        end
       plays_recorder[i] = choice
      end
      if board.check_for_winner(player1) == player1
        winner = [board.check_for_winner(player1), plays_recorder]
      elsif board.check_for_winner(player2) == player2
        winner = board.check_for_winner(player2)
      else
        winner = "Tie"
      end

      expect(winner).to eq("O") | eq("Tie")
    end

  end

end