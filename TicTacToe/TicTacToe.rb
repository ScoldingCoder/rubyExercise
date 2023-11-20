require 'pry-byebug'

class Player
    attr_accessor :name
    attr_reader :symbol

    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end 

    def changeName

        puts "Hello #{self.name}, What is your name?  Your symbol is #{self.symbol}"
        self.name = gets.chomp
        puts "Hello #{self.name}"

    end   

end 


class Game < Player

    

    def initialize 
        board = [1,2,3,4,5,6,7,8,9]
        puts "Hello! This is a console edition of Tic-Tac-Toe.
To play this edition, each player enters a number to place their symbol on the board.
The number entered corresponds to a position on the board as shown in the sample board below:

"
        puts  darwBoard(board)
        puts "If the number is not a valid position or the position has already been played, You will be asked to make another selection
Good Luck and have fun!"
         
    end

    def darwBoard (boardArray)

        puts "#{boardArray [0]} | #{boardArray [1]} | #{boardArray [2]} " 
        puts "-----------"
        puts "#{boardArray [3]} | #{boardArray [4]} | #{boardArray [5]} "
        puts "-----------"
        puts "#{boardArray [6]} | #{boardArray [7]} | #{boardArray [8]} "
      

    end

end    



ticTacToe = Game.new
#board = Array.new(9)
#board = [1,2,3,4,5,6,7,8,9]
#ticTacToe.darwBoard(board)