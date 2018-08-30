
class InputInterface

  def initialize(input_manager = STDIN)
    @input_manager = input_manager
  end

  def receive
    input_manager.gets.chomp
  end

  private

  attr_reader :input_manager

end