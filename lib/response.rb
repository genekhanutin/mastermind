class Response
	def self.too_many_char
	  "You typed too many characters, please type 4!"
	end 

	def self.not_enough_char
		"Not enough characters, please type 4!"
	end

	def self.color_unknown
		"Sorry, this color is not included in the game. Please choose from r,g,b,y"
	end 

	def self.num_correct_positions_message(number_of_correct_positions)
		"You have guessed #{number_of_correct_positions} correct position(s)"
	end

	def self.num_correct_colors_message(number_of_correct_colors)
		"You have guessed #{number_of_correct_colors} correct color(s)"
	end


	def self.win_play_again
		"You've won! would you like to play again? Select (p)lay or (q)uit"
	end

	def self.guess_again(guess_count)
		"Guess again! You have #{guess_count} guesses left "
	end

	def self.welcome_message
		"hi"
	end

	def self.instructions_message
		"heres how you play mastermind. Enter p to play or q to quit."
	end

	def self.unknown_input
		"not sure what that means"
	end

	def self.goodbye_message
		"bye!"
	end

	def self.generated_sequence_guess_message
		"ive generated a secret code, take a guess"
	end
end

