
class WinnerChecker

  def initialize(board)
    @winning_combos = [[7, 4, 1], [7, 8, 9], [7, 5, 3], [8, 5, 2], [9, 6, 3],
                      [4, 5, 6], [1, 2, 3], [1, 5, 9]]
    @board = board
  end

  def check_for_winner(player)
    result = []
    player_boxes = board.player_boxes(player)
    @winning_combos.each do |i|
      player_boxes.each do |j|
        i.map!{ |element| element == j.to_i ? player : element}
      end
      return player if i == [player, player, player]
    end
    return false
  end

  private

  attr_reader :winning_combos
  attr_reader :board

end