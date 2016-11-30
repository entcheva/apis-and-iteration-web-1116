def welcome
  puts "What'd up, ain't star wars grand?"
  # puts out a welcome message here!
end

def get_character_from_user
  puts "Kindly enter a character name...do not enter Jar Jar Binks"
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
