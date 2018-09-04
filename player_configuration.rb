
class PlayerConfiguration

  attr_reader :output_interface
  attr_reader :input_interface

  def initialize(output_interface, input_interface)
    @output_interface = output_interface
    @input_interface = input_interface
  end

  def player_request(player = 1)
    system 'cls'
    option_selected = ""
    acceptable_inputs = ["h", "c"]
    until acceptable_inputs.include? option_selected do
      output_interface.send "player #{player}, human or computer? (h/c)"
      option_selected = input_interface.receive
      output_interface.send "h for human or c for computer.."
    end
    return option_selected
  end

  private

  def acceptable_inputs
    return ["h", "c"]
  end

end