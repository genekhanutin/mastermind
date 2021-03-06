class Response
	def self.too_many_char
	  puts "You typed too many characters, please type 4!"
	end 

	def self.not_enough_char
		puts "Not enough characters, please type 4!"
	end

	def self.lose_message(generated_sequence)
		puts "you lose! you're out of guesses! The secret code was #{generated_sequence} would you like to play again? Select (p)lay or (q)uit"
	end

	def self.color_unknown
		puts "You chose a color thats not in the game. Please choose from r,g,b,y"
	end 

	def self.num_correct_positions_message(number_of_correct_positions)
		puts "You have guessed #{number_of_correct_positions} correct position(s)"
	end

	def self.num_correct_colors_message(number_of_correct_colors)
		puts "You have guessed #{number_of_correct_colors} correct color(s)"
	end


	def self.win_play_again(guess_count)
		puts "You've won! You had #{guess_count} guess(es) left would you like to play again? Select (p)lay or (q)uit"
	end

	def self.guess_again(guess_count)
		puts "Guess again! You have #{guess_count} guesses left "
	end

	def self.welcome_message
		puts "hi"
	end

	def self.instructions_message
		puts "heres how you play mastermind. Enter p to play or q to quit."
	end

	def self.unknown_input
		puts "not sure what that means"
	end

	def self.goodbye_message
		puts "bye!"
	end

	def self.generated_sequence_guess_message
		puts "ive generated a secret code, take a guess"
	end
end

