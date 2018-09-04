
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

  def initialize
    @messages = []
  end

  def puts(message)
    @messages << message
  end

  def message
    @messages.last
  end

  private

  attr_reader :messages

end

class FakeOutputInterface

  attr_reader :output_manager

  def initialize(output_manager = FakeOutput.new)
    @output_manager = output_manager

  end

  def send(this)
    output_manager.puts this
  end

  def message
    output_manager.message
  end

end

class FakeInputInterface

  attr_reader :input_manager

  def initialize(input_manager = FakeInput.new)
    @input_manager = input_manager
  end

  def receive
    input_manager.gets.chomp
  end

end

class FakeBoard

  attr_accessor :boxes

  def initialize
    @boxes = { "7" => :empty, "8" => :empty, "9" => :empty,
               "4" => :empty, "5" => :empty, "6" => :empty,
               "1" => :empty, "2" => :empty, "3" => :empty }
  end

  def play_on_box(selected_box, current_player)
    boxes[selected_box] = current_player
  end

  def player_boxes(current_player)
    players_boxes = boxes.select { |k,v| v == current_player }
    players_boxes.keys
  end

  def available_boxes
    empty_boxes =boxes.select { |k,v| v == :empty }
    empty_boxes.keys
  end

  private

end