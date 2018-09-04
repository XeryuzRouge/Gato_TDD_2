
class CPU

  def initialize(board)
    @board = board   
  end

  def move(player)
    board.play_on_box(board.available_boxes.sample, player)
  end

  private

  attr_reader :board

end