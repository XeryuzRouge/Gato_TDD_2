
class TerminalInput

  def initialize(terminal = STDIN)
    @terminal = terminal
  end

  def message
     @terminal.gets.chomp
  end

end