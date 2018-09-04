require_relative '..\cpu'
require_relative 'tdd_classes'

RSpec.describe CPU do

  let(:cpu) { CPU.new(board) }
  let(:board) { FakeBoard.new }

  it "Should choose an available box" do

    player = "O"

    board.boxes = { "7" => "X", "8" => "O", "9" => "X",
                    "4" => "X", "5" => :empty, "6" => "X",
                    "1" => "O", "2" => "X", "3" => "O" }

    cpu.move(player)
    expect(board.boxes["5"]).to eq "O"

  end

end