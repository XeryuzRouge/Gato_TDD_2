require_relative 'io_managers/terminal_input'

module InputModule

  attr_reader :input_manager

  def init_input(manager = TerminalInput.new)
    @input_manager = manager
  end

  def receive
    @input_manager.message
  end

end