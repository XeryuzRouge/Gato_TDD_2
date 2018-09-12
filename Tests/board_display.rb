
require_relative '..\board_display'
require_relative 'tdd_classes'

RSpec.describe BoardDisplay do
	let(:board_displayer) { BoardDisplay.new(fake_interface, empty) }
	let(:fake_interface) { FakeOutputInterface.new(output) }
	let(:output) { FakeOutput.new }
  let(:empty) { " " }

	it 'Should return intuitive board at the first 2 turns of the match' do
    turn = 1

		example_boxes = { "7" => empty, "8" => empty, "9" => empty,
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => empty, "2" => empty, "3" => empty }

		expected_board = ' ⁷ ║ ⁸ ║ ⁹ ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 ' ⁴ ║ ⁵ ║ ⁶ ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' ¹ ║ ² ║ ³ ' + "\n"

    board_displayer.request(example_boxes, turn)

		expect(output.message).to eq expected_board

	end

	it 'Should return board with current boxes' do
    turn = 4

		example_boxes = { "7" => :'X', "8" => empty, "9" => :'O',
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => :'O', "2" => empty, "3" => :'X' }

  	expected_board = ' X ║   ║ O ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 '   ║   ║   ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' O ║   ║ X ' + "\n" 
                     print turn
    board_displayer.request(example_boxes, turn)
		expect(output.message).to eq expected_board
	end
end