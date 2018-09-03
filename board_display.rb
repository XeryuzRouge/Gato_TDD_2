
class BoardDisplay

	def initialize(output_interface)
		@output_interface = output_interface
		@vs = '║'
		@horizontal_separator = '═══╬═══╬═══'
	end

	def request(boxes)
		box = 9
		row = 1
		board = ''
			while row <= 3 do
				column = 0
				while column <= 2
					boxes[(box - column).to_s] = " " if boxes[(box - column).to_s] == :empty
					column += 1
				end
				board +=  " #{boxes[(box - 2).to_s]} " + "#{vs}" + 
				          " #{boxes[(box - 1).to_s]} " + "#{vs}" + 
				          " #{boxes[(box).to_s]} " + "\n"
				 board += horizontal_separator + "\n" if row < 3
				box = box - 3
				row += 1
			end
		output_interface.send board
		return board
	end

	def clear_screen
		output_interface.clear_display
	end

	private

	attr_reader :vs
	attr_reader :horizontal_separator
	attr_reader :output_interface

end