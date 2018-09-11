
require_relative 'plays_counter'
require_relative 'board_analyzer'

class CPU

  def initialize(board, player)
    @player = player
    @board = board
  end

  def move(turn)
    board_analyzer = BoardAnalyzer.new
    plays_counter = PlaysCounter.new
    box_selected = nil

    box_selected = board_analyzer.analyze(board, player)
    box_selected = plays_counter.special_moves(board, player, turn) if box_selected == nil && turn <= 4
    box_selected = board.available_boxes.sample if box_selected == nil

    board.play_on_box(box_selected.to_s, player)
  end

  private

  attr_reader :board
  attr_reader :player

end