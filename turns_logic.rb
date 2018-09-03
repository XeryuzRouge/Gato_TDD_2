
class TurnsLogic

  attr_reader :current_turn
  attr_reader :current_player

  def initialize(players)
    @player1 = players[0]
    @player2 = players[1]
    @current_turn = 0
    @current_player = player1
  end

  def next
    @current_turn += 1
    swap_players
  end

  private

  def swap_players
    if @current_player == player1
      @current_player = player2
    elsif @current_player == player2
      @current_player = player1
    end
  end

  attr_reader :player1
  attr_reader :player2

end