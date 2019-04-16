
require_relative 'game_configuration/output_module'
require_relative 'game_configuration/input_module'

class HumanInput

  include OutputModule
  include InputModule
  
  def initialize(board)
    init_output
    init_input
    @board = board
  end

  def play(player)
    choice = receive
    input_filter(choice, player)
  end

  private

  attr_reader :board

  def input_filter(choice, player)
    if board.available_boxes.include? choice
      board.play_on_box(choice, player)
    else
      show_invalid
      play(player)
    end
  end
  
end