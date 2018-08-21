
class Interface

  def initialize(output_manager = STDOUT, input_manager)
    @output_manager = output_manager
    @input_manager = input_manager
  end

  def output(this)
    output_manager.puts this
  end

  def input
    input_manager.gets.chomp
  end

  private

  attr_reader :output_manager
  attr_reader :input_manager

end