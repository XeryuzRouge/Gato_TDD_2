
module InputModule

  attr_reader :input_manager

  def init_input(manager = TerminalInput.new)
    @input_manager = manager
  end

  def receive
    @input_manager.get
  end

end