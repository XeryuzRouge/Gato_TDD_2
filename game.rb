class Game

  attr_reader :p1
  attr_reader :p2

  def initialize(player_config)
    #didn't work without @
    @p1 = player_config.player_request(1)
    @p2 = player_config.player_request(2)
  end

end