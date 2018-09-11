
require_relative '..\turns_logic'

RSpec.describe TurnsLogic do


  let(:turns) {TurnsLogic.new(players)}

  let(:players) { {player1: player_1, player2: player_2} }

  let(:player_1) { {sign: "X", config: "h"} }
  let(:player_2) { {sign: "O", config: "c"} }

  it "should be turn 0 at beginning" do
    expect(turns.current_turn).to eq 0
  end

  it "should keep the count of turns" do
    turns.next
    turns.next
    expect(turns.current_turn).to eq 2
  end

  it "1 turn should beginng with player1 sign" do
    turns.next
    expect(turns.current_player).to eq "X"
  end

  it "should swap players turn" do
    turns.next
    expect(turns.current_player).to eq "X"
    turns.next
    expect(turns.current_player).to eq "O"
  end

  it "should tell if the turn is for a human or cpu" do
    turns.next
    expect(turns.human_turn).to eq true
    expect(turns.cpu_turn).to eq false
    turns.next
    expect(turns.human_turn).to eq false
    expect(turns.cpu_turn).to eq true
  end

end