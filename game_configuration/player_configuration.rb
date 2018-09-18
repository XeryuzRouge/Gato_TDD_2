
require_relative 'output_interface'
require_relative 'input_interface'

class PlayerConfiguration

  attr_reader :output_interface
  attr_reader :input_interface
  attr_reader :acceptable_characters
  attr_reader :game_characters

  def initialize
    @output_interface = OutputInterface.new
    @input_interface = InputInterface.new
    @acceptable_characters = { human: "h", computer: "c"}
    @game_characters = { X: "X", O: "O"}
  end

  def player_request(player = 1)
    output_interface.clear_display
    option_selected = ""
    until @acceptable_characters.values.include? option_selected do
      output_interface.send "player #{player}, human or computer? (h/c)"
      option_selected = input_interface.receive
      output_interface.send "h for human or c for computer.." if (@acceptable_characters.values.include? option_selected) == false
    end
    return option_selected
  end

end