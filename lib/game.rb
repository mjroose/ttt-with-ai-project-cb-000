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
    winning_combo = false
    WIN_COMBINATIONS.each do |combo|
      winning_combo = combo if winning_combo?(combo, self.player_1) || winning_combo?(combo, self.player_2)
    end
    winning_combo
  end

  def winning_combo?(combo, player)
    positions = find_player_positions(player)
    (positions + combo).uniq.count == positions.count
  end

  def draw?
    self.board.turn_count == 9 && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    combo = self.won?
    if combo
      winning_combo?(combo, self.player_1) ? player_1.token : player_2.token
    end
  end

  def turn

  end
end
