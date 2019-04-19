
require_relative '../terminal_input'
require_relative '../../../Tests/tdd_classes'

RSpec.describe TerminalInput do

  let(:fake_stdin) { FakeSTDIN.new }
  let(:terminal) { TerminalInput.new(fake_stdin) }

  it 'Should receive anything as STDIN input' do
    fake_stdin.set("input")
    expect(terminal.message).to eq "input"
  end

end
