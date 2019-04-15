
require_relative '../board/board'
require_relative 'turns_exchanger'
require_relative '../human_input'
require_relative '../cpu/cpu_input'

class Match

	attr_reader :human_input
	
	def initialize(players_config, input_manager, output)
		@turn = TurnsExchanger.new(players_config)
		@board = Board.new(output)
		@output = output
		@human_input = HumanInput.new(board, input_manager, output)
		thinking_time = 0
		@cpu_input = CPUInput.new(board, thinking_time)
		board.show
	end

	def start
		winner = false
    until (turn.match_completed ) || (winner != false) do
			winner = next_move
		end
		results(winner)
	end

	private

	attr_reader :board
	attr_reader :turn
	attr_reader :cpu_input

	def next_move
		turn.next

		human_input.play(turn.player) if turn.belongs_to == :human
		cpu_input.move(turn.player, turn.current) if turn.belongs_to == :computer

		if board.check_for_winner(turn.player) != false
    	return turn.player
    else
    	return false
  	end

	end

	def results(winner)
		if winner == false
			@output.show "Tie"
			winner = "Tie"
			return winner
		else
			@output.show "The winner is: #{winner}"
			return winner
		end
	end
	
end