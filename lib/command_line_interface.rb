def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  puts input.downcase
  # binding.pry
  return input.split.map(&:capitalize).join(" ")
end
