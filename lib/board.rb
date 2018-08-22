class Board
  attr_accessor :cells

  def initialize
    self.cells.reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
end