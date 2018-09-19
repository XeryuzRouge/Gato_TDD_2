
require_relative '..\output_interface'
require_relative '..\..\tests\tdd_classes'

RSpec.describe OutputInterface do

  let(:output_interface) { OutputInterface.new(output) }
  let(:output) { FakeOutput.new }

  it 'Should output anything that is given' do

    example = 'This is something to show'
    output_interface.send example
    expect(output.message).to eq 'This is something to show'

  end

end