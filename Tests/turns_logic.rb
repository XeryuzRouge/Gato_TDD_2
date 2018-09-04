
require_relative '..\turns_logic'

RSpec.describe TurnsLogic do


  let(:turns) {TurnsLogic.new(players_sign, players_config)}

  let(:players_sign) {["X", "O"]}
  let(:players_config) {["h", "c"]}

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

  it "should tell if player is human or cpu" do
    expect(turns.human_turn).to eq true
    expect(turns.cpu_turn).to eq false
    turns.next
    expect(turns.human_turn).to eq false
    expect(turns.cpu_turn).to eq true
  end

end