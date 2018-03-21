def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets
  return character.join(" ")
end

def get_title_from_user
	puts "Please enter a title"
	title = gets
	return title.join(" ")
end
