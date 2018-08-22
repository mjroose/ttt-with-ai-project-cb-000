class Game
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    player_1_cells = []
    self.board.cells.each_with_index do |value, index|
      player_1_cells << index if value == self.player_1.token
    end

    player_2_cells = []
    self.board.cells.each_with_index do |value, index|
      player_2_cells << index if value == self.player_2.token
    end
    binding.pry
    
    winning_combo = []
    WIN_COMBINATIONS.each do |combo|
      test_player_1 = (player_1_cells + combo).uniq.count == 9
      test_player_2 = (player_2_cells + combo).uniq.count == 9
      winning_combo = combo if test_player_1 || test_player_2
    end
    winning_combo
  end
end
