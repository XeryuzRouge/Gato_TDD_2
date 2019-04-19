
require_relative '../turns_exchanger'

RSpec.describe TurnsExchanger do

  let(:turns) {TurnsExchanger.new(players)}
  let(:players) { {player1: player_1, player2: player_2} }
  let(:player_1) { {sign: "X", config: :human} }
  let(:player_2) { {sign: "O", config: :computer} }

  it "should be turn 0 at beginning" do
    expect(turns.current).to eq 0
  end

  it "should keep the count of turns" do
    turns.next
    turns.next
    expect(turns.current).to eq 2
  end

  it "1 turn should begin with player1 sign" do
    turns.next
    expect(turns.player).to eq "X"
  end

  it "should swap players turn" do
    turns.next
    expect(turns.player).to eq "X"
    turns.next
    expect(turns.player).to eq "O"
  end

end
