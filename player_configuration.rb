
class PlayerConfiguration

  def initialize(interface)
    @interface = interface
  end

  def player_request(player = 1)
    interface.output 'player #{player}, human or computer? (h/c)'
    option_selected = interface.input
    return option_selected if acceptable_inputs.include? option_selected
    interface.output 'h for human or c for computer..'
  end

  private

  attr_reader :interface

  def acceptable_inputs
    return ["h", "c"]
  end

end