require_relative 'board'
require_relative 'board_display'
require_relative 'turns_logic'
require_relative 'player_input'
require_relative 'winner_checker'

class MatchManager
	def initialize(output_interface, input_interface)
		@turns = TurnsLogic.new(["X", "O"])
		@board = Board.new
		@winner_checker = WinnerChecker.new(board)
		@player_input = PlayerInput.new(input_interface, @board)
		@board_displayer = BoardDisplay.new(output_interface)
		@winner = false
		display_board
		start_match
	end

	private

	def start_match
    until (turns.current_turn > 8 ) || (winner == true) do
			next_move
		end
	end

	def next_move 
		move_filter
    got_winner if winner_checker.check_for_winner(turns.current_player) == turns.current_player
		turns.next
	end

	def move_filter
		move_accepted = false
		until move_accepted == true do
			move_accepted = player_input.play(turns.current_player)
			display_board
			print "\n box already taken" if move_accepted == false
		end
	end

	def display_board
		board_displayer.clear_screen
		board_displayer.request(board.boxes)
	end

	def got_winner
		print "The winner is: #{turns.current_player}"
		@winner = true
	end

	attr_reader :board
	attr_reader :board_displayer
	attr_reader :turns
	attr_reader :player_input
	attr_reader :winner_checker
	attr_reader :winner
end