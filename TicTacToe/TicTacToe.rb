require 'pry-byebug'

class Player
    attr_accessor :name
    attr_reader :symbol

    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end 

    def changeName

        puts "Hello #{self.name}, What is your name? Your symbol is '#{self.symbol}' "
        self.name = gets.chomp
        puts "Hello #{self.name}

        "
    end   
end 

class Game < Player

    def initialize 
        board = [1,2,3,4,5,6,7,8,9]
        puts "Hello! This is a console edition of Tic-Tac-Toe.
To play this edition, each player enters a number to place their symbol on the board.
The number entered corresponds to a position on the board as shown in the sample board below:

"
        puts  drawBoard(board)
        puts "If the value entered is not a valid position or the position has already been played,you will be asked to make another selection
Good Luck and have fun! 
                               
"
   
    end

    def drawBoard (board_array)

        puts " #{board_array [0]}  |  #{board_array [1]}  |  #{board_array [2]} " 
        puts "---------------"
        puts " #{board_array [3]}  |  #{board_array [4]}  |  #{board_array [5]} "
        puts "---------------"
        puts " #{board_array [6]}  |  #{board_array [7]}  |  #{board_array [8]} "
      

    end


    def promptPlayer (player,game_board,round_count) 
        
        puts "#{player.name}, please eneter the number for the position you would like to play"
        position = gets.chomp
        puts " "
        validate(position,game_board, player,round_count)
       
    end   

    def validate (position, game_board, player,round_count)

        if (position.to_i .between?(1,9)&& game_board[(position.to_i)-1]== " ")
          game_board[(position.to_i)-1] = player.symbol
          drawBoard(game_board)
        else
          puts"The position entered is not valid"
           position = promptPlayer(player, game_board, round_count)
            
        end   

    end    

    def switchActive(active, p_one, p_two)

        active == p_one ? active = p_two : active = p_one

    end   


    def  checkForWinner (board, active_player, round_count, game_done)

        winning_condition = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    
        winner_found = false

        if(round_count.between?(5,9))
          check_array = Array.new

            winning_condition.each_index{|i|
                for j in 0..2 do
                    element = winning_condition[i][j]
                    check_array.push (board[element]) 
                    
                    
                    if( check_array.length == 3 &&check_array.all?{|symbol| symbol == active_player.symbol } )  
                        winner_found = true 
                        $game_done = true  
                        puts "Congrats #{active_player.name}! You won!"
                        break

                    elsif(check_array.length == 3)
                        check_array.clear
                    end 

                end
    
            } 

        end

        if (round_count == 9 && winner_found == false)
            puts"It's a tie!"
            $game_done = true
        end   
        $game_done
    
    end

    def play

        game_board =Array.new(9, " ")
        round_count = 0 # only increment on valid move, check for winner after 5 rounds, check for draw after 9 
        player_one = Player.new("Player One","X")
        player_two = Player.new("Player Two","O")
        player_one.changeName
        player_two.changeName
        active_player = player_one
        $game_done = false
        puts drawBoard(game_board)

        while($game_done == false)
            position = promptPlayer(active_player,game_board, round_count)
            round_count+=1
            checkForWinner(game_board, active_player, round_count, $game_done)
            active_player = switchActive(active_player, player_one, player_two)

        end
        
        puts "Thanks for playing!"
        
    end    

end    


ticTacToe = Game.new
ticTacToe.play
