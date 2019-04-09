
require_relative 'game_configuration/output_module'
require_relative 'game_configuration/input_module'
require_relative 'game_configuration/text_input'

class HumanInput

  include OutputModule
  include InputModule
  
  def initialize(board, input_manager)
    init_output
    init_input(input_manager)
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
      show "\ninvalid box\n"
      play(player)
    end
  end
  
end