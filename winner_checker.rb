
class WinnerChecker

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