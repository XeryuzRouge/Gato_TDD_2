
class HumanInput
  
  def initialize(board, input, output)
    @input = input
    @output = output
    @board = board
  end

  def play(player)
    choice = @input.message
    input_filter(choice, player)
  end

  private

  attr_reader :board

  def input_filter(choice, player)
    if board.available_boxes.include? choice
      board.play_on_box(choice, player)
    else
      @output.invalid
      play(player)
    end
  end
  
end
