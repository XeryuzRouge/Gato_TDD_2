require_relative '../text_input'
require_relative '../../tests/tdd_classes'

RSpec.describe TextInput do

	let(:input_file) { "input.txt" }
  let(:text_input) { TextInput.new(input_file) }

	it 'Should get text file content' do
    write_input_file("input")
    expect(text_input.message).to eq "input"
  end

  private

  def write_input_file(message)
    text_file = File.open(input_file, 'w')
    text_file.write(message)
    text_file.close
  end

end