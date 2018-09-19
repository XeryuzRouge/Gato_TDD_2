
class PlaysCounter

  def initialize
    @corner_boxes = ["7", "9", "1", "3"]
    @cross_boxes = ["4", "8", "2", "6"]
  end

  def special_moves(board, player, turn)
    @board = board
    @player = player
    if turn <= 2
      first_move
    else
      second_move(turn)
    end
  end

  private

  attr_reader :board
  attr_reader :player
  attr_reader :corner_boxes
  attr_reader :cross_boxes

  def first_move
    if board.available_boxes.include? "5"
      return "5"
    else
      return corner_boxes.sample
    end
  end

  def second_move(turn)

    return (corner_boxes & board.available_boxes).sample if turn == 3

    opponent_boxes = board.opponent_boxes(player)
    counter_plays.each do |i|
      if (opponent_boxes.include? i[0]) && (opponent_boxes.include? i[1])
        return (i[2] & board.available_boxes).sample
      end
    end
    return nil
  end

  def counter_plays
    [["7", "3", cross_boxes], ["1", "9", cross_boxes],
    ["7", "5", corner_boxes], ["9", "5", corner_boxes], ["1", "5", corner_boxes], ["3", "5", corner_boxes],
    ["3", "4", ["1"]], ["1", "6", ["3"]], ["4", "9", ["7"]], ["6", "7", ["9"]],
    ["1", "8", ["7"]], ["3", "8", ["9"]], ["2", "7", ["1"]], ["2", "9", ["3"]],
    ["2", "4", ["1"]], ["2", "6", ["3"]], ["4", "8", ["7"]], ["6", "8", ["9"]]]
  end

end