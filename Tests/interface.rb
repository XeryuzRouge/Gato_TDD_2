
require 'rspec'
require_relative '..\interface'
require_relative 'tdd_classes'

RSpec.describe Interface do

  let(:interface) { Interface.new(output, input) }
  let(:output) { FakeOutput.new }
  let(:input) { FakeInput.new }

  it 'Should output anything that is given' do

    example = 'This is something to show'
    interface.output example
    expect(output.message).to eq 'This is something to show'

  end

  it 'Should send an input' do

    input.this_one("p")
    expect(interface.input).to eq "p"

  end

end