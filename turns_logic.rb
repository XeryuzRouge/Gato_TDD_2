
class TurnsLogic

  attr_reader :current_turn
  attr_reader :human_turn
  attr_reader :cpu_turn

  def initialize(players)
    @player1 = players[:player1]
    @player2 = players[:player2]
    @current_turn = 0
    @actual_player = @player1
    swap_players
  end

  def next
    @current_turn += 1
    swap_players
  end

  def completed
    return true if @current_turn == 9
  end

  def current_player
    @actual_player[:sign]
  end

  private

  def swap_players
    if @actual_player == @player1
      @actual_player = @player2
    else
      @actual_player = @player1
    end
    if @actual_player[:config] == "h"
      @human_turn = true
      @cpu_turn = false
    elsif @actual_player[:config] == "c"
      @human_turn = false
      @cpu_turn = true
    end
  end

  attr_reader :player1
  attr_reader :player2
  attr_reader :actual_player

end