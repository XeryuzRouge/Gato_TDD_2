
class FakeInput

  attr_reader :one
  attr_reader :i

  def initialize
    @one = []
    @i = 0
  end

  def this_one(one)
    @one = one
  end

  def try_these(these)
    @i = 0
    @one = these
  end

  def get
    @i += 1
    return @one[@i - 1]
  end

end

class FakeOutput

  attr_reader :messages

  def initialize
    @messages = []
  end

  def board(boxes)
    @messages << boxes
  end

  def invalid
    @messages << "invalid box message"
  end

  def configuration_options(player)
    @messages << "configuration options message"
  end

  def configuration_options_error
    @messages << "configuration options error message"
  end

  def tie
    @messages << "tie message"
  end

  def winner(player)
    @messages << "Winner message #{player}"
  end

  def clear
    @messages << "display cleared"
  end

  def message
    @messages.last
  end

end

class FakeSTDOUT

  attr_reader :messages

  def initialize
    @messages = []
  end

  def puts(message)
    @messages << message
  end

  def message
    @messages.last
  end

end

class FakeSTDIN

  def initialize
    @messages = []
  end

  def set(message)
     @messages << message
  end

  def gets
    @messages.last
  end

end