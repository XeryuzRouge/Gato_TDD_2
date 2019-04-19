
require_relative 'plays_counter'
require_relative 'board_analyzer'

class CPUInput

  def initialize(board, thinking_time)
    @player = player
    @board = board
    @thinking_time = thinking_time
  end

  def move(player, turn)
    board_analyzer = BoardAnalyzer.new
    plays_counter = PlaysCounter.new
    box_selected = nil

    box_selected = board_analyzer.analyze(board, player)
    box_selected = plays_counter.special_moves(board, player, turn) if box_selected == nil && turn <= 4
    box_selected = board.available_boxes.sample if box_selected == nil
    sleep(thinking_time)
    board.play_on_box(box_selected.to_s, player)
  end

  private

  attr_reader :board
  attr_reader :player
  attr_reader :thinking_time

end
