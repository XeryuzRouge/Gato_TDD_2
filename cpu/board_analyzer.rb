
class BoardAnalyzer

  def analyze(board, player)
    block_combo = nil
    winning_combo = nil
    board.winning_combos.each do |i|
      opponent_combo = 0
      possible_option = 0
      player_combo = 0
      i.each do |j|
        possible_option = j if j.class == Fixnum
        opponent_combo += 1  if j.class != Fixnum && j != player
        player_combo += 1  if j == player
      end
      winning_combo = possible_option if opponent_combo == 0 && player_combo == 2
      block_combo = possible_option if opponent_combo == 2 && player_combo == 0
    end
    if winning_combo != nil
      return winning_combo
    elsif block_combo != nil
      return block_combo
    else
      return nil
    end
  end

end