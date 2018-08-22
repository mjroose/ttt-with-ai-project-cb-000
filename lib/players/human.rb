class Players
  class Human < Player
    def move(board)
      puts "Please enter your next move:"
      gets.chomp
    end
  end
end
