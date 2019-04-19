
class GameConfiguration

  def players_characters
    return { human: ["h", "H"], computer: ["c", "C"] }
  end

  def game_characters(player)
    player = player.to_s
    signs = { "1" => "X", "2" => "O"}
    return signs[player]
  end

end
