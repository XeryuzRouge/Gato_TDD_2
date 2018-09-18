
class BoardDisplay

	def initialize(output_interface, empty)
		@output = output_interface
		@empty = empty
		@vertical_separator = '║'
		@horizontal_separator = '═══╬═══╬═══'
		@boxes_displayed = {"7" => "\u2077", "8" => "\u2078", "9" => "\u2079",
               				 "4" => "\u2074", "5" => "\u2075", "6" => "\u2076",
               				 "1" => "\u00B9", "2" => "\u00B2", "3" => "\u00B3" }
	end

	def request(boxes)
		box = 9
		row = 1
		board = ''
			while row <= 3 do
				column = 0
				while column <= 2
						boxes_displayed[(box - column).to_s] = 
						boxes[(box - column).to_s] if boxes[(box - column).to_s] != @empty
					column += 1
				end
				board +=  " #{boxes_displayed[(box - 2).to_s]} " + "#{vertical_separator}" + 
				          " #{boxes_displayed[(box - 1).to_s]} " + "#{vertical_separator}" + 
				          " #{boxes_displayed[(box).to_s]} " + "\n"
				 board += horizontal_separator + "\n" if row < 3
				box = box - 3
				row += 1
			end
			@output.clear_display
		@output.send "#{board} \n"
		clean_boxes
	end

	def clean_boxes
		@boxes_displayed.each { |k,v| @boxes_displayed[k] = @empty }
	end

	private

	attr_reader :vertical_separator
	attr_reader :horizontal_separator
	attr_reader :output_interface
	attr_reader :boxes_displayed
	attr_reader :empty

end