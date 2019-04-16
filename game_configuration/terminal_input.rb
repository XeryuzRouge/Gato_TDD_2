
class TerminalInput

	def initialize(terminal = STDIN)
		@terminal = terminal
	end

	def get
		 @terminal.gets.chomp
	end

end