def caesar_cipher (text , key)
   chiperString =""
   text_ascii = text.codepoints 
   text_ascii.each{ |letter|
   if (letter.between?(65,90))
    letter+= key
    if (letter > 90)
        letter = (letter%90) +64
        end    
   end
   if (letter.between?(97,122))
      letter+= key
      if (letter > 122)
          letter = (letter%122) +97
          end    
     end
   new_letter = letter.chr
   chiperString.concat(new_letter)
   } 
   chiperString

end    

