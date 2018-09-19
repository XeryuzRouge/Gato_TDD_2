
class HumanInput
  
  def initialize(output_interface, input_interface, board)
    @output = output_interface
    @input = input_interface
    @board = board
  end

  def play(player)
    choice = @input.receive
    input_filter(choice, player)
  end

  private

  attr_reader :input
  attr_reader :output
  attr_reader :board

  def input_filter(choice, player)
    if board.available_boxes.include? choice
      board.play_on_box(choice, player)
    else
      @output.send "\ninvalid box\n"
      play(player)
    end
  end
  
end