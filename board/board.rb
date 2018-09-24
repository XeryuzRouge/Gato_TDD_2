
require_relative 'board_display'
require_relative 'winner_checker'

class Board

  attr_reader :boxes
  attr_reader :winning_combos
  attr_reader :empty

  def initialize
    @empty = " " 
    @displayer = BoardDisplay.new(empty)            
    @boxes = { "7" => empty, "8" => empty, "9" => empty,
               "4" => empty, "5" => empty, "6" => empty,
               "1" => empty, "2" => empty, "3" => empty }

    @winning_combos = [[7, 4, 1], [7, 8, 9], [7, 5, 3], [8, 5, 2], [9, 6, 3],
                      [4, 5, 6], [1, 2, 3], [1, 5, 9]]
  end

  def play_on_box(selected_box, current_player)
    boxes[selected_box] = current_player
    show
    check_for_winner(current_player)
  end

  def player_boxes(current_player)
    players_boxes = boxes.select { |k,v| v == current_player }
    players_boxes.keys
  end

  def opponent_boxes(current_player)
    boxes.keys - available_boxes - player_boxes(current_player)
  end

  def available_boxes
    empty_boxes = boxes.select { |k,v| v == empty }
    empty_boxes.keys
  end

  def show
    @displayer.request(boxes)
  end

  def check_for_winner(player)
    winner_checker = WinnerChecker.new
    winner_checker.analyze_board(player_boxes(player), player, @winning_combos)
  end

end