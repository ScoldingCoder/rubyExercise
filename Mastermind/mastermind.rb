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

         @round_count = 1
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

        # Create another loop for the actual game which tracks number of rounds played or when the game is done


        #This loops prompts user for code and validates it 
        loop do
            puts"Enter your guess"
            user_guess = getUserNumbers()
            if (( user_guess.length == 4 ) && (user_guess.all?('1'..'6') ) )
                compareGuessAndCode(user_guess , computer_code )
                break
                
            end
         
        end

       
        #puts "#{user_guess}"

        #puts "I am the codebreaker"

    end



    def userIsCodemaker()

        puts "I am the codemaker"

    end

    #get the secret code from the computer
    def  getComputerCode()
        random = Random.new
        computer_code = Array.new(4){random.rand(1..6).to_s}

        puts "The computer code is #{computer_code}"
        computer_code

    end


    # Gets the secret code or guess from human user
    def getUserNumbers()
        user_number = gets.chomp
        user_number =user_number.split("")
        
    end


    def compareGuessAndCode(guess,code)

        if (guess == code)
            puts "The codebreaker has won!"

        elsif( !( (guess & code).empty? ) )

            puts "Checking for hints "

        else

            puts "Your guess does not contain any element in the secret code!"
        
        end  

    end

end

mastermind = Game.new
choice = mastermind.selectRole
mastermind.executeRole(choice)
