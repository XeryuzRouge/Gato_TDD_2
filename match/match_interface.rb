
require_relative '../board/board'
require_relative 'turns_exchanger'
require_relative 'human_input'
require_relative '../cpu/cpu_input'

class MatchInterface
	
	def initialize(output_interface, input_interface, players_config)
		@turn = TurnsExchanger.new(players_config)
		@output = output_interface
		@board = Board.new(output)
		@human_input = HumanInput.new(output, input_interface, board)
		thinking_time = 1
		@cpu_input = CPUInput.new(board, thinking_time)
		@winner = false
		@human = players_config[:human_player]
		@computer = players_config[:computer_player]
		board.display
		start
	end

	private

	attr_reader :board
	attr_reader :turn
	attr_reader :winner
	attr_reader :human_input
	attr_reader :cpu_input
	attr_reader :output
	attr_reader :human
	attr_reader :computer

	def start
    until (turn.match_completed ) || (@winner != false) do
			next_move
		end
		results(@winner)
	end

	def next_move
		turn.next
		human_input.play(turn.player) if turn.belongs_to == human
		cpu_input.move(turn.player, turn.current) if turn.belongs_to == computer
    @winner = board.check_for_winner(turn.player)
	end

	def results(winner)
		if winner == false
			@output.send "Tie"
		else
			@output.send "The winner is: #{winner}"
		end
	end
	
end