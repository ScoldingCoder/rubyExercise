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

        code_breaker = Player.new
        code_maker = Player.new

        case selection
        when '1'
            userIsCodebreaker(code_maker,code_breaker)
           
        when '2'
            userIsCodemaker(code_maker,code_breaker)   
        
        else
            "Idk what happened to end up here"
        end

    end

    def userIsCodebreaker(maker, breaker)

        maker.code = getComputerCode()

        # Create another loop for the actual game which tracks number of rounds played or when the game is done


        #This loops prompts user for code and validates it 
     
            puts"Enter your guess"
            breaker.code = getUserNumbers()
            
            compareGuessAndCode(breaker.code, maker.code)
    

        #puts "#{user_guess}"

        #puts "I am the codebreaker"

    end



    def userIsCodemaker(maker, breaker)

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
        loop do
            user_number = gets.chomp
            user_number =user_number.split("")
            if (( user_number.length == 4 ) && (user_number.all?('1'..'6') ) )  
                 return user_number 
                break  
            end
         puts "The number entered is not valid. Please try again"
        end
        
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
