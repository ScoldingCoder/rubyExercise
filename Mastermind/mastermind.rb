require 'pry-byebug'

class Player
  attr_accessor :code

  def initialize
    @code = '1234' # default value for code for both the code maker and breaker
  end
end

class Game < Player
  attr_accessor :round_count

  def initialize
    @@round_count = 1
    @@game_done = false

    puts 'This is where i would put the introduction and explain the rules and how to play'
  end

  # user selects to be the codemaker or codebreaker
  def selectRole
    puts "Press '1' to be the codebreaker and '2' to be the codemaker"
    option = gets.chomp
    puts ' '
    vaidateRole(option)
  end

  # validates the role selection option
  def vaidateRole(selection)
    if selection.to_i == 1 || selection.to_i == 2
      selection
    else
      puts 'Invalid option entered'
      option = selectRole

    end
  end

  # Plays game based on user role
  def executeRole(selection)
    code_breaker = Player.new
    code_maker = Player.new

    case selection
    when '1'
      userIsCodebreaker(code_maker, code_breaker)

    when '2'
      userIsCodemaker(code_maker, code_breaker)

    else
      'Idk what happened to end up here'
    end
  end

  # user chose to be the codebreaker
  def userIsCodebreaker(maker, breaker)
    maker.code = getComputerCode

    while @@round_count < 11 && @@game_done == false

      puts "Round # #{@@round_count}"

      puts 'This is you last attempt!' if @@round_count == 10

      puts 'Enter your guess'
      breaker.code = getUserNumbers
      @@round_count += 1
      hint = compareGuessAndCode(breaker.code, maker.code)
      if hint != 'BBBB'
        puts "Hint:#{hint.join}"

      else

        @@game_done = true
        puts 'The codebreaker won!'

      end

    end

    return unless @@game_done == false && @@round_count >= 11

    @@game_done = true
    puts 'The codemaker won!'
    puts "The secret code was #{maker.code.join}"
  end

  # user chose to be the codemaker
  def userIsCodemaker(maker, breaker)
    puts ' Please enter your secret code'

    maker.code = getUserNumbers
    valid_codes = %w[1 2 3 4 5 6].repeated_permutation(4).to_a

    while @@round_count < 11 && @@game_done == false

      puts "Round # #{@@round_count}"

      puts 'This is your last attempt!' if @@round_count == 10

      puts 'Enter your guess'

      # the first guess is a pair of repating numbers selected at random
      if @@round_count == 1

        numbers = %w[1 2 3 4 5 6]
        first_guess = []

        2.times  do
          random = Random.new
          index = random.rand(0..numbers.size - 1)
          [numbers[index]].cycle(2) { |element| first_guess.push(element) }
          first_guess
        end
        puts "#{first_guess.join}"
        breaker.code = first_guess

      else

        random = Random.new
        index = random.rand(0..valid_codes.length - 1)
        puts "#{valid_codes[index].join}"
        breaker.code = valid_codes[index]

      end

      @@round_count += 1

      hint = compareGuessAndCode(breaker.code, maker.code)
      valid_codes = filterFromList(breaker.code, hint, valid_codes)

      if hint != 'BBBB'
        puts "Hint:#{hint.join}"

      else

        @@game_done = true
        puts 'The codebreaker won!'

      end

    end

    return unless @@game_done == false && @@round_count >= 11

    @@game_done = true
    puts 'The codemaker won!'
    puts "The secret code was #{maker.code.join}"
  end

  # get the secret code from the computer
  def getComputerCode
    random = Random.new
    computer_code = Array.new(4) { random.rand(1..6).to_s }
  end

  # Gets the secret code or guess from human user
  def getUserNumbers
    loop do
      user_number = gets.chomp
      user_number = user_number.split('')
      if (user_number.length == 4) && user_number.all?('1'..'6')
        return user_number
        break
      end
      puts 'The number entered is not valid. Please try again'
    end
  end

  # comapres the guess made to the secret code, returns the
  def compareGuessAndCode(guess, code)
    if guess == code

      score = 'BBBB'

    elsif !(guess & code).empty?

      dictionary = code.uniq
      black_peg = 0 # for numbers found in the correct position
      white_peg = 0 # for numbers found but in the wrong position

      dictionary.each do |element|
        guess.each_index do |index|
          if element == guess[index] && guess[index] == code[index]
            black_peg += 1

          elsif guess[index] == element && guess.count(guess[index]) <= code.count(guess[index])
            white_peg += 1
          end
        end
      end

      score = []
      ['B'].cycle(black_peg) { |element| score.push(element) }
      ['W'].cycle(white_peg) { |element| score.push(element) }

      score

    else

      score = []

    end
  end

  # narrows valid guess based on Donald Knuth Algorithm
  def filterFromList(assumed_guess, score, list)
    list.each do |assumed_code|
      hint = compareGuessAndCode(assumed_guess, assumed_code)

      list.delete(assumed_code) if hint != score
    end

    list
  end
end

mastermind = Game.new
choice = mastermind.selectRole
mastermind.executeRole(choice)
