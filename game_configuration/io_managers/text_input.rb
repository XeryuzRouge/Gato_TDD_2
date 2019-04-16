
class TextInput

	def initialize(file_path = 'input.txt')
		@file_path = file_path
	end

	def message
		text_file = File.open(@file_path, 'r')
    message = text_file.read()
    text_file.close
    return message
	end

end