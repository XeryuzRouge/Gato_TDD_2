
require_relative '../board/board'
require_relative 'turns_exchanger'
require_relative '../human_input'
require_relative '../cpu/cpu_input'
require_relative '../game_configuration/output_module'

class Match

	attr_reader :human_input

	include OutputModule
	
	def initialize(players_config)
		init_output
		@turn = TurnsExchanger.new(players_config)
		@board = Board.new
		@human_input = HumanInput.new(board)
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
			show "Tie"
			winner = "Tie"
			return winner
		else
			show "The winner is: #{winner}"
			return winner
		end
	end
	
end