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

         @@round_count = 1
         @@game_done = false
         
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

        #maker.code = getComputerCode()
        maker.code = ['1','1','2','2']

    

        while (@@round_count < 11 &&  @@game_done == false)

            puts"Round # #{@@round_count}"
            puts"Enter your guess"
            breaker.code = getUserNumbers()
            @@round_count+=1
            hint = compareGuessAndCode(breaker.code, maker.code)
            
    
        end 
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

    #comapres the guess made to the secret code, returns the hint or the lets the code breaker know
    def compareGuessAndCode(guess,code)

        if (guess == code)
            puts "The codebreaker has won!"
            @@game_done = true

        elsif( !( (guess & code).empty? ) )

            dictionary = code.uniq
            black_peg = 0 # for numbers found in the correct position
            white_peg = 0 # for numbers found but in the wrong position
           
            dictionary.each {|element|
                guess.each_index{|index|

                if (element == guess[index] && guess[index]== code[index] )
                    black_peg +=1
                    
                elsif ( guess[index] == element && guess.count(guess[ index ]) == 1)
                    white_peg +=1
                end    

              }

            }

            score = []
            ["B"].cycle(black_peg){|element| score.push(element)}
            ["W"].cycle(white_peg){|element| score.push(element)}
            puts "Hint:#{score.to_s}"
            score

        else

            puts "Your guess does not contain any element in the secret code!"
        
        end  

    end

end

mastermind = Game.new
choice = mastermind.selectRole
mastermind.executeRole(choice)
