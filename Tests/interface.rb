
require 'rspec'
require_relative 'tdd_classes'
require_relative '..\interface'

RSpec.describe Interface do

  let(:interface) { Interface.new(output, input) }
  let(:output) { FakeOutput.new }
  let(:input) { FakeInput.new }

  it 'Should output anything that is given' do

    example = 'This is something to show'
    interface.lets_output example
    expect(output.message).to eq 'This is something to show'

  end

  it 'Should send an input' do

    input.this_one("p")
    expect(interface.input_request).to eq "p"

  end

end