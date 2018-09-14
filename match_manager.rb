
require_relative 'board/board'
require_relative 'board/board_display'
require_relative 'turns_logic'
require_relative 'human_input'
require_relative 'cpu/cpu'

class MatchManager
	
	def initialize(output_interface, input_interface, players_config)
		@board = Board.new
		@turns = TurnsLogic.new(players_config)
		@output = output_interface
		@board_displayer = BoardDisplay.new(@output, board.empty)
		@human_input = HumanInput.new(@output, input_interface, board)
		@winner = false
		display_board
		start_match
	end

	private

	attr_reader :board
	attr_reader :board_displayer
	attr_reader :human_input
	attr_reader :turns
	attr_reader :winner
	attr_reader :output

	def start_match
    until (turns.completed ) || (winner == true) do
			next_move
		end
		@output.send "Tie" if winner == false
	end

	def next_move
		turns.next
		if turns.human_turn == true
			human_input.play(turns.current_player)
		end
		if turns.cpu_turn == true
			cpu = CPU.new(board, turns.current_player)
			cpu.move(turns.current_turn)
		end
		display_board
    got_winner if board.check_for_winner(turns.current_player) == turns.current_player
	end

	def display_board
		board_displayer.clear_screen
		board_displayer.request(board.boxes)
		@output.send "\n"
	end

	def got_winner
		@output.send "The winner is: #{turns.current_player}"
		@winner = true
	end
	
end