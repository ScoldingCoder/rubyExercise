require 'pry-byebug'


class Player

    attr_accessor :code

    def initialize()
        @code = '1234' #default value for code for both the code maker and breaker
    end


end



class Game < Player

    attr_accessor :round_count

    def initialize()

         @round_count = 0
        puts "This is where i would put the introduction and explain the rules and how to play"
        
    end


    def selectRole()
        puts "Press '1' to be the codebreaker and '2' to be the codemaker"
        option = gets.chomp
        puts " "
        vaidateRole(option)
       
    end


    def vaidateRole(selection)

        if (selection.to_i == 1 || selection.to_i == 2)
            selection
        else 
            puts "Invalid option entered"
            option = selectRole()
            
        end
    end


    def executeRole (selection)

        case selection
        when '1'
            userIsCodebreaker()
        when '2'
            userIsCodemaker()   
        
        else
            "Idk what happened to end up here"
        end

    end

    def userIsCodebreaker()

        computer_code = getComputerCode()
        puts "Enter your guess"
        getUserCode()

        #puts "I am the codebreaker"

    end



    def userIsCodemaker()

        puts "I am the codemaker"

    end


    def  getComputerCode()
        random = Random.new
        computer_code = Array.new(4){random.rand(1..6)}

    end

    def getUserCode()
        user_code = gets.chomp
        user_code =user_code.split("")
        puts user_code
    end

end

mastermind = Game.new
choice = mastermind.selectRole
mastermind.executeRole(choice)
