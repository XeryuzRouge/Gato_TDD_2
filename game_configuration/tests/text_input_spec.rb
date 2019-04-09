
require_relative '../text_input.rb'

RSpec.describe TextInput do

  it 'should give a text file content' do
    File.open("test_file.txt", 'w') {|f| f.write("This is a test") }
    text_input = TextInput.new("test_file.txt")

    expect(text_input.gets).to eq "This is a test"
  end

end
