require_relative 'board'
require_relative 'board_display'
require_relative 'turns_logic'
require_relative 'player_input'
require_relative 'winner_checker'
require_relative 'cpu'

class MatchManager
	def initialize(output_interface, input_interface, players)
		@turns = TurnsLogic.new(["X", "O"], players)
		@board = Board.new
		@board_displayer = BoardDisplay.new(output_interface)
		@winner_checker = WinnerChecker.new(board)
		@player_input = PlayerInput.new(input_interface, board)
		@cpu = CPU.new(board)
		@winner = false
		display_board
		start_match
	end

	private

	def start_match
    until (turns.completed ) || (winner == true) do
			next_move
		end
	end

	def next_move
		turns.next
		human_move_filter if turns.human_turn == true
		cpu.move(turns.current_player) if turns.cpu_turn == true
		display_board
    got_winner if winner_checker.check_for_winner(turns.current_player) == 
    turns.current_player
	end

	def human_move_filter
		move_accepted = false
		until move_accepted == true do
			move_accepted = player_input.play(turns.current_player)
			print "\n invalid box\n" if move_accepted == false
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
	attr_reader :cpu
end