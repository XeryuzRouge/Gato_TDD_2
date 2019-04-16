require_relative 'io_managers/terminal_output'

module OutputModule

  attr_reader :output_manager

  def init_output(manager = TerminalOutput.new())
     @output_manager = manager
  end

  def show_board(boxes)
    @output_manager.board boxes
  end

  def show_invalid
    @output_manager.invalid
  end

  def show_configuration_options(player)
    @output_manager.configuration_options(player)
  end

  def show_configuration_options_error
    @output_manager.configuration_options_error
  end

  def show_tie
    @output_manager.tie
  end

  def show_winner(player)
    @output_manager.winner(player)
  end

end