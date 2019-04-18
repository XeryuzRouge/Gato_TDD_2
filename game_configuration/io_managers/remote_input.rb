
class RemoteInput

  def initialize(file_path = 'input.txt')
    @file_path = file_path
  end

  def message
    message = ""
    
  until message != ""
    sleep(1)
    message = read(@file_path)
    end

    clear(@file_path)
    return message
  end

  private

  def read(file_path)
    text_file = File.open(file_path, 'r')
    message = text_file.read()
    text_file.close
    message
  end

  def clear(file_path)
    text_file = File.open(file_path, 'w')
    text_file.truncate(0)
    text_file.close()
  end

end