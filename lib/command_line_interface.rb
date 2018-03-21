def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
<<<<<<< HEAD
  character = gets
  return character.join(" ")
end

def get_title_from_user
	puts "Please enter a title"
	title = gets
	return title.join(" ")
=======
  input = gets.chomp
  puts input.downcase
  # binding.pry
  return input.split.map(&:capitalize).join(" ")
>>>>>>> 5ee27c264438f3396fe9a7d9fdb87b875e2137dc
end
