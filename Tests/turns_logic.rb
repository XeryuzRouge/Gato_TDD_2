
require_relative '..\turns_logic'

RSpec.describe TurnsLogic do


  let(:turns) {TurnsLogic.new(players)}

  let(:players) {["X", "O"]}

  it "should be turn 0 at beginning" do
    expect(turns.current_turn).to eq 0
  end

  it "should keep the count of turns" do
    turns.next
    turns.next
    expect(turns.current_turn).to eq 2
  end

  it "should swap players turn" do
    expect(turns.current_player).to eq "X"
    turns.next
    expect(turns.current_player).to eq "O"
  end

end