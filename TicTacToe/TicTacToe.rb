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
    
    end

end    




playerOne = Player.new( "Player One", " 'X' ")
playerOne.changeName
playerTwo = Player.new( "Player Two", " 'O' ")
playerTwo.changeName