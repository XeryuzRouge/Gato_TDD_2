require_relative '../remote_output'
require_relative '../../tests/tdd_classes'

RSpec.describe RemoteOutput do
  let(:empty) { " " }
  let(:output_file) { "output.txt" }
  let(:remote_output) { RemoteOutput.new(output_file) }

  it 'Should write configuration options' do
    remote_output.configuration_options(1)
    expect(output_file_content).to eq "configuration_options player 1"
  end

  it 'Should delete file content before rewriting it' do
  	remote_output.configuration_options(2)
  	expect(output_file_content).to eq "configuration_options player 2"

  	remote_output.configuration_options("unknown")
  	expect(output_file_content).to eq "configuration_options player unknown"
  end

  it 'Should write configuration options error' do
    remote_output.configuration_options_error
    expect(output_file_content).to eq "configuration_options_error"
  end

  it 'Should write board status' do
  	remote_output.board(empty_boxes)
  	expect(output_file_content).to eq "" +
		 '[["7", " "], ["8", " "], ["9", " "], ' +
  		'["4", " "], ["5", " "], ["6", " "], ' +
  		'["1", " "], ["2", " "], ["3", " "]]'

  	remote_output.board(played_boxes)
  	expect(output_file_content).to eq "" +
			'[["7", "X"], ["8", " "], ["9", " "], ' +
  		 '["4", " "], ["5", "X"], ["6", " "], ' +
  		 '["1", "O"], ["2", " "], ["3", "O"]]'
  end

  it 'Should write invalid box message' do
    remote_output.invalid
    expect(output_file_content).to eq "invalid"
  end

  it 'Should write winner' do
    remote_output.winner("X")
    expect(output_file_content).to eq "winner X"
    remote_output.winner("someone else")
    expect(output_file_content).to eq "winner someone else"
  end

  it 'Should write tie' do
    remote_output.tie
    expect(output_file_content).to eq "tie"
  end

  private

  def output_file_content
    text_file = File.open(output_file, 'r')
    text_file.read()
  end

  def empty_boxes
  	empty = " "
  	{ "7" => empty, "8" => empty, "9" => empty,
    	"4" => empty, "5" => empty, "6" => empty,
    	"1" => empty, "2" => empty, "3" => empty }
  end

  def played_boxes
  	empty = " "
  	{ "7" => "X", "8" => empty, "9" => empty,
    	"4" => empty, "5" => "X", "6" => empty,
    	"1" => "O", "2" => empty, "3" => "O" }
  end

end