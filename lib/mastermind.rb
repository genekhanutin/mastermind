require_relative 'response'

class Mastermind

	attr_reader :generated_sequence, :correct_positions, :correct_colors

	def initialize
		@colors = ['r','g','b','y']
		@generated_sequence = nil
		@guess_count = 15
	end

	def color_shuffle
		@generated_sequence = (@colors * 5).sample(4).join
	end

	def guess(user_input)
		user_input#evaluate_guess(user_input)
	end

	def evaluate_entry(user_input)
		guess = user_input
		if guess.length > 4
			:too_many_char
		elsif guess.length < 4
			:not_enough_char
		elsif !all_chars_valid?(user_input)
			:color_unknown
		else
			#evaluate_guess
		end
	end

	def all_chars_valid?(input)
		input.each_char.all? do |letter|
		  @colors.include?(letter)
		end
	end

	# def evaluate_colors(guess, color_code = generated_sequence)
	# 	correct_colors = 0
		
	# 		end
	# 	end
	# 	correct_colors
	# end

	def evaluate_positions(guess, color_code = generated_sequence)
		correct_positions = 0
		guess = guess.split("")
		generated_sequence = color_code.split("")
		guess.each_with_index do |color, position|
			if color == generated_sequence[position]
				correct_positions += 1		
			end
		end
		correct_positions
	end

	def evaluate_guess(guess, code = generated_sequence)
		# takes in a guess and a code
		# return number of correct colors(method) and number of correct positions(method)
		# {:colors => "number of correct colors", :positions => "number in correct positions"}
	end

	# def evaluate_guess(user_input)
	# 			guess = user_input
	# 	if guess == generated_sequence
	# 		:win_play_again
	# 	elsif 
	# 	else guess != generated_sequence
	# 		"Guess again" #also display message 
	# 		@guess_count -= 1
	# 	end
	# end

end



# mm = Mastermind.new

# message = mm.evaluate_entry("rby")

# print = Response.new

# puts print.send(message)

# puts mm.color_shuffle
