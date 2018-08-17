
class Interface

  def initialize(output = STDOUT, input)

    @output = output
    @input = input

  end

  def lets_output(this)
    output.puts this
  end

  def input_request
    input.gets.chomp
  end

  private

  attr_reader :output
  attr_reader :input

end