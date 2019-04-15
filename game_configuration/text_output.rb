
class TextOutput

  def puts
  	@output_text = File.open('output.txt', 'w')
    @output_text.write(message)
    @output_text.close
  end

end