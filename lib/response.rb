class Response

	def too_many_char
	  "You typed too many characters, please type 4!"
	end 

	def not_enough_char
		"Not enough characters, please type 4!"
	end

	def color_unknown
		"Sorry, this color is not included in the game. Please choose from r,g,b,y"
	end 

	def correct_positions_correct_colors(guess, num_positions, num_colors)
		"Good job, you guessed #{guess}, with #{num_correct_positions}......"
	end

	def win_play_again
		"You've won, would you like to play again? Select (p)lay or (q)uit"
	end

	def guess_again
	end
end

