
module OutputModule

  attr_reader :output_manager
  attr_reader :output_text

  def init_output(manager = STDOUT)
     @output_manager = manager
  end

  def show(message)
    @output_manager.puts message
    write_text message
  end

  def clear_display
    system "cls"
  end

  private

  def write_text(message)
    @output_text = File.open('output.txt', 'w')
    @output_text.write(message)
    @output_text.close
  end

end