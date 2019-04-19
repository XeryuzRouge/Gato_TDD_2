
class TurnsExchanger

  attr_reader :current
  attr_reader :belongs_to

  def initialize(players)
    @player1 = players[:player1]
    @player2 = players[:player2]
    @current = 0
    @actual_player = @player1
    swap_players
  end

  def next
    @current += 1
    swap_players
  end

  def player
    @actual_player[:sign]
  end

  def match_completed
    return true if @current == 9
  end

  private

  def swap_players
    if @actual_player == @player1
      @actual_player = @player2
    else
      @actual_player = @player1
    end
      @belongs_to = @actual_player[:player_type]
  end

  attr_reader :player1
  attr_reader :player2
  attr_reader :actual_player

end
