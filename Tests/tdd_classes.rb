
class FakeInput

  attr_reader :one

  def initialize
    @one = "h"  
  end

  def this_one(one)
    @one = one
  end
  def gets
    one
  end
end

class FakeOutput

  attr_reader :message

  def puts(message)
    @message = message
  end
  
end