
class PlayerInput

  attr_reader :input_interface
  
  def initialize(input_interface, board)
    @input_interface = input_interface
    @board = board
  end

  def play(player)
    choice = input_interface.receive
    input_filter(choice, player)
  end

  private

  def input_filter(choice, player)
    board.play_on_box(choice, player) if board.available_boxes.include? choice
  end

  attr_reader :board

end