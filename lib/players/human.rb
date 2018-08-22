class Players
  class Human < Player
    def move(board)
      puts "#{self.token}, please enter your next move:"
      gets.chomp
    end
  end

  class Computer < Player
    def move(board)
      random_number = Random.new
      position = "0"
      while !board.valid_move?(position)
        position = (random_number.rand(8) + 1).to_s
      end
      position
    end
  end
end
