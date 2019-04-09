
class TextInput

  attr_reader :text_file

  def initialize(text_file)
    @text_file = text_file
  end

  def gets
  	input = ""
  	until input != ""
  		sleep(1)
  		input = read_text(@text_file)
  	end
  	clear_text(@text_file)
  	input
  end

  private

  def read_text(text_file)
  	@input_text = File.open(text_file, 'r')
  	input = @input_text.read()
  	@input_text.close()
  	input
  end

  def clear_text(text_file)
  	@input_text = File.open(text_file, 'w')
  	@input_text.truncate(0)
  	@input_text.close()
  end

end