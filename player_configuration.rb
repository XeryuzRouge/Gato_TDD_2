
class PlayerConfiguration

  attr_reader :output_interface
  attr_reader :input_interface

  def initialize(output_interface, input_interface)
    @output_interface = output_interface
    @input_interface = input_interface
  end

  def player_request(player = 1)
    system 'cls'
    output_interface.send "player #{player}, human or computer? (h/c)"
    option_selected = input_interface.receive
    return option_selected if acceptable_inputs.include? option_selected
    output_interface.send "h for human or c for computer.."
  end

  private

  def acceptable_inputs
    return ["h", "c"]
  end

end