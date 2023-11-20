def substrings(text, dictionary) 
    match_array = Array.new(1)
    test = text.downcase.split(" ")
    test.each{ |word|
        dictionary.each{|list|
        if(word.include?(list))
            match_array<<list  
        end
        }
    }
    match_array.shift
    match_array.reduce(Hash.new(0)) do |result,match|
      result[match] += 1
      result
      end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#substrings("below", dictionary)

substrings("Howdy partner, sit down! How's it going?", dictionary)