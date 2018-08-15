
class PlayerConfiguration

  def initialize(input, output = STDOUT)
    @input = input
    @output = output
  end

  def player_request(player = 1)
    output.puts 'player #{player}, human or computer? (h/c)'
    option_selected = input.gets.chomp
    return option_selected if acceptable_inputs.include? option_selected
    output.puts 'h for human or c for computer..'
  end

  private

  attr_reader :input
  attr_reader :output

  def acceptable_inputs
    return ["h", "c"]
  end

end