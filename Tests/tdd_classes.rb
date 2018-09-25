
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

  def gets
    @i += 1
    return @one[@i - 1]
  end

end

class FakeOutput

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