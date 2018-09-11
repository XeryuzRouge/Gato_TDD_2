
class HumanInput

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
    if board.available_boxes.include? choice
      board.play_on_box(choice, player)
      return true
    end
    return false
  end

  attr_reader :board

end