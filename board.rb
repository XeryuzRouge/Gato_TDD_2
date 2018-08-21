
require_relative 'board_display'

class Board

  def initialize
    @boxes = { "7" => :empty, "8" => :empty, "9" => :empty,
               "4" => :empty, "5" => :empty, "6" => :empty,
               "1" => :empty, "2" => :empty, "3" => :empty }
    @displayer = BoardDisplay.new
  end

  def play_on_box(selected_box, current_player)
    boxes[selected_box] = current_player
  end

  def player_boxes(current_player)
    players_boxes = boxes.select { |k,v| v == current_player }
    players_boxes.keys
  end

  def status
    boxes
  end

  def displayer
    @displayer.request(boxes.keys)
  end

  private

  attr_reader :boxes
  attr_reader :displayer

end