
module InputModule

  attr_reader :input_manager

  def init_input(manager)
    @input_manager = manager
  end

  def receive
    @input_manager.gets.chomp
  end

end