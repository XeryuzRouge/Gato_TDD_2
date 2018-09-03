
class OutputInterface

  def initialize(output_manager = STDOUT)
    @output_manager = output_manager
  end

  def send(message)
    output_manager.puts message
  end

  def clear_display
    system "cls"
  end

  private

  attr_reader :output_manager

end