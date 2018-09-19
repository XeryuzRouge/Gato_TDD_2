
require_relative '..\input_interface'
require_relative '..\..\tests\tdd_classes'

RSpec.describe InputInterface do

  let(:input_interface) { InputInterface.new(input) }
  let(:input) { FakeInput.new }

  it 'Should send an input' do

    input.this_one("p")
    expect(input_interface.receive).to eq "p"

  end

end