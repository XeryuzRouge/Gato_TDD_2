
class Output

  attr_reader :output_manager

  def initialize(manager)
     @output_manager = manager
  end

  def show(message)
    @output_manager.puts message
  end

  def clear_display
    system "cls"
  end

end