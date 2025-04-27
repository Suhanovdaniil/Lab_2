require 'set'

def is_pangram
  print "Введите строку: "
  sentence = gets.chomp.downcase

  letters = Set.new
  sentence.each_char do |char|
    if char >= 'a' && char <= 'z'
        letters.add(char)
    end
  end
  letters.size == 26
end

if is_pangram
  puts "true"
else
  puts "false"
end
