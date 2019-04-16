
class TextOutput

	def initialize(file_path = 'output.txt')
		@file_path = file_path
	end

	def configuration_options(player)
    write("configuration_options player #{player}")
	end

	def configuration_options_error
    write("configuration_options_error")
	end

	def board(boxes)
		 write(boxes.to_a)
	end

	def winner(player)
		 write("winner #{player}")
	end

	def tie
		 write("tie")
	end

	private

	def write(message)
		text_file = File.open(@file_path, 'w')
		clear_content(text_file)

    text_file.write(message)
    text_file.close
	end

	def clear_content(text_file)
		text_file.truncate(0)
	end

end