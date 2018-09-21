
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

class FakeHumanInput

  attr_reader :choices
  attr_reader :i

  def initialize
    @i = 0
    @choices = [7, 4, 8, 5, 9, 6]
  end

  def gets
    @i += 1
    return @choices[@i].to_s
  end

end

class FakeConfigurationInput

  def gets
    return "c"
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

class FakeOutputInterface

  attr_reader :output_manager

  def initialize(output_manager = FakeOutput.new)
    @output_manager = output_manager

  end

  def send(this)
    output_manager.puts this
  end

  def last_message
    output_manager.message
  end

  def clear_display
    system "cls"
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

  def try_these(these)
    input_manager.try_these(these)
  end

end

class FakeBoard

  attr_accessor :boxes
  attr_reader :winning_combos
  attr_accessor :empty

  def initialize
    @boxes = { "7" => :empty, "8" => :empty, "9" => :empty,
               "4" => :empty, "5" => :empty, "6" => :empty,
               "1" => :empty, "2" => :empty, "3" => :empty }

    @winning_combos = [[7, 4, 1], [7, 8, 9], [7, 5, 3], [8, 5, 2], [9, 6, 3],
                      [4, 5, 6], [1, 2, 3], [1, 5, 9]]
  end

  def play_on_box(selected_box, current_player)
    boxes[selected_box] = current_player
    check_for_winner(current_player)
    return current_player, selected_box
  end

  def player_boxes(current_player)
    players_boxes = boxes.select { |k,v| v == current_player }
    players_boxes.keys
  end

  def opponent_boxes(current_player)
    boxes.keys - available_boxes - player_boxes(current_player)
  end

  def available_boxes
    empty_boxes =boxes.select { |k,v| v == :empty }
    empty_boxes.keys
  end
  
   def check_for_winner(player)
    winner_checker = FakeWinnerChecker.new
    winner_checker.analyze_board(player_boxes(player), player, @winning_combos)
  end

end

class RandomInputs

  def play(available_boxes)
    available_boxes.sample
  end

end

class FakeWinnerChecker

  def analyze_board(player_boxes, player, winning_combos)
    result = []
    winning_combos.each do |i|
      player_boxes.each do |j|
        i.map!{ |element| element == j.to_i ? player : element}
      end
      return player if i == [player, player, player]
    end
    return false
  end

end

class FakeplayersConfiguration

  def initialize
    
  end

end