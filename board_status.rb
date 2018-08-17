
class BoardStatus

  attr_reader :boxes

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

end