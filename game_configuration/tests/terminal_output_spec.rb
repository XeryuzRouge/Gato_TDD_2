
require_relative '../terminal_output'
require_relative '../../tests/tdd_classes'

RSpec.describe TerminalOutput do
  let(:empty) { " " }
  let(:fake_stdout) { FakeSTDOUT.new }
  let(:terminal) { TerminalOutput.new(fake_stdout) }

  it 'Should display invalid box' do
    terminal.invalid
    expect(fake_stdout.message).to eq "\ninvalid box\n"
  end

  it 'Should display configuration options' do
    terminal.configuration_options(1)
    expect(fake_stdout.message).to eq "player 1, human or computer? (h/c)"
    terminal.configuration_options("unknown")
    expect(fake_stdout.message).to eq "player unknown, human or computer? (h/c)"
  end

  it 'Should display configuration options error' do
    terminal.configuration_options_error
    expect(fake_stdout.message).to eq "h for human or c for computer.."
  end

  it 'Should display tie' do
    terminal.tie
    expect(fake_stdout.message).to eq "Tie"
  end

  it 'Should display winner' do
    terminal.winner("X")
    expect(fake_stdout.message).to eq "The winner is: X"
    terminal.winner("someone else")
    expect(fake_stdout.message).to eq "The winner is: someone else"
  end

  it 'Should clear the display' do
    stdout_clear_screen_command = "\e[H\e[2J"
    terminal.clear
    expect(fake_stdout.message).to eq stdout_clear_screen_command
  end

	it 'Should display intuitive board at the first turn of the match' do

		example_boxes = { "7" => empty, "8" => empty, "9" => empty,
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => empty, "2" => empty, "3" => empty }

		expected_board = ' ⁷ ║ ⁸ ║ ⁹ ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 ' ⁴ ║ ⁵ ║ ⁶ ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' ¹ ║ ² ║ ³ ' + "\n " + "\n"

    terminal.board(example_boxes)

		expect(fake_stdout.message).to eq expected_board

	end

  it 'Should clear the empty boxes' do

    example_boxes = { "7" => empty, "8" => empty, "9" => empty,
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => empty, "2" => empty, "3" => empty }

    terminal.clear_boxes

    expected_board = '   ║   ║   ' + "\n" +
                     '═══╬═══╬═══' + "\n" + 
                     '   ║   ║   ' + "\n" + 
                     '═══╬═══╬═══' + "\n" + 
                     '   ║   ║   ' + "\n " + "\n"

    terminal.board(example_boxes)

    expect(fake_stdout.message).to eq expected_board

  end

	it 'Should display board with current boxes' do

    terminal.clear_boxes

		example_boxes = { "7" => :'X', "8" => empty, "9" => :'O',
                      "4" => empty, "5" => empty, "6" => empty,
                      "1" => :'O', "2" => empty, "3" => :'X' }

  	expected_board = ' X ║   ║ O ' + "\n" +
										 '═══╬═══╬═══' + "\n" + 
										 '   ║   ║   ' + "\n" + 
										 '═══╬═══╬═══' + "\n" + 
										 ' O ║   ║ X ' + "\n " + "\n" 
    terminal.board(example_boxes)
		expect(fake_stdout.message).to eq expected_board
	end
end