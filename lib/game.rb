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

  def find_player_positions(player)
    positions = []
    self.board.cells.each_with_index do |value, index|
      positions << index if value == player.token
    end

    positions
  end

  def won?
    player_1_cells = self.find_player_positions(self.player_1)
    player_2_cells = self.find_player_positions(self.player_2)
    winning_combo = false

    WIN_COMBINATIONS.each do |combo|
      player_1_wins = (player_1_cells + combo).uniq.count == player_1_cells.count
      player_2_wins = (player_2_cells + combo).uniq.count == player_2_cells.count
      winning_combo = combo if player_1_wins || player_2_wins
    end
    
    winning_combo
  end
end
