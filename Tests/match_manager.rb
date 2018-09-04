
require_relative '..\match_manager'
require_relative 'tdd_classes'

RSpec.describe MatchManager do

  let(:match_manager) { MatchManager.new(interface) }
  let(:interface) { FakeInterface.new }

  it 'should manage turns' do
    expect(match_manager.next_turn).to eq 2
  end
end