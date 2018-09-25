
require_relative '../cpu_input'
require_relative '../../board/board'

RSpec.describe CPUInput do

  matches = Array.new(5)

  matches.each do

    it 'should never lose' do
      board = Board.new
      player1 = "X" 
      player2 = "O"
      winner = " "
      thinking_time = 0
      plays_recorder = {}

      opponent_cpu = CPUInput.new(board, thinking_time)
      turns = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      turns.each do |i|
        if (i%2) == 0
          choice = opponent_cpu.move(player2, i)
        else
          choice = board.play_on_box(board.available_boxes.sample, player1)
        end

        plays_recorder[i] = choice

        if board.check_for_winner(player1) == player1
          winner = [board.check_for_winner(player1), plays_recorder]
          break
        elsif board.check_for_winner(player2) == player2
          winner = board.check_for_winner(player2)
          break
        end
      end

      winner = "Tie" if winner == " "

      expect(winner).to match(/O|Tie/)
    end

  end

end