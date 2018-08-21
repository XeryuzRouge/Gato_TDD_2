
require 'rspec'
require_relative '..\board_display'

RSpec.describe BoardDisplay do

	let(:board_displayer) { BoardDisplay.new }

	it 'Should return board empty at beginning of a game' do

		example_boxes = { "7" => :empty, "8" => :empty, "9" => :empty,
                      "4" => :empty, "5" => :empty, "6" => :empty,
                      "1" => :empty, "2" => :empty, "3" => :empty }
		expected_board = '   ║   ║   ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 '   ║   ║   ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 '   ║   ║   ' + "\n"

		expect(board_displayer.request(example_boxes)).to eq expected_board

	end

	it 'Should return board with current boxes' do

		example_boxes = { "7" => :'X', "8" => :empty, "9" => :'O',
                      "4" => :empty, "5" => :empty, "6" => :empty,
                      "1" => :'O', "2" => :empty, "3" => :'X' }
  	expected_board = ' O ║   ║ X ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 '   ║   ║   ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' X ║   ║ O ' + "\n" 
		expect(board_displayer.request(example_boxes)).to eq expected_board
	end

end