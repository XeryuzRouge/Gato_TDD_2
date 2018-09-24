
require_relative '..\board_display'
require_relative '..\..\tests\tdd_classes'

RSpec.describe BoardDisplay do
	let(:board_displayer) { BoardDisplay.new(empty) }
	let(:output) { FakeOutput.new }
  let(:empty) { " " }

  before(:each) do
    board_displayer.init_output(output)
  end

	it 'Should return intuitive board at the first turn of the match' do

		example_boxes = { "7" => empty, "8" => empty, "9" => empty,
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => empty, "2" => empty, "3" => empty }

		expected_board = ' ⁷ ║ ⁸ ║ ⁹ ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 ' ⁴ ║ ⁵ ║ ⁶ ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' ¹ ║ ² ║ ³ ' + "\n " + "\n"

    board_displayer.request(example_boxes)

		expect(output.message).to eq expected_board

	end

  it 'Should clean the empty boxes' do

    example_boxes = { "7" => empty, "8" => empty, "9" => empty,
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => empty, "2" => empty, "3" => empty }

    board_displayer.clean_boxes

    expected_board = '   ║   ║   ' + "\n" +
                     '═══╬═══╬═══' + "\n" + 
                     '   ║   ║   ' + "\n" + 
                     '═══╬═══╬═══' + "\n" + 
                     '   ║   ║   ' + "\n " + "\n"

    board_displayer.request(example_boxes)

    expect(output.message).to eq expected_board

  end

	it 'Should return board with current boxes' do

    board_displayer.clean_boxes

		example_boxes = { "7" => :'X', "8" => empty, "9" => :'O',
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => :'O', "2" => empty, "3" => :'X' }

  	expected_board = ' X ║   ║ O ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 '   ║   ║   ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' O ║   ║ X ' + "\n " + "\n" 
    board_displayer.request(example_boxes)
		expect(output.message).to eq expected_board
	end
end