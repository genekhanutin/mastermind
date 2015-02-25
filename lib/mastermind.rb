require_relative 'response'

class Mastermind

	attr_reader :generated_sequence

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

	def user_entry_valid?(user_input)
		#confirms user input does not contain foreign characters
		#if string length < or > 4 puts message "invalid entry"
		#checks if
		guess = user_input
		# pass in all messages as methods
		if guess.length > 4
			:too_many_char
		elsif guess.length < 4
			:not_enough_char
		# elsif # confirms guess only includes r,g,y,b by comparing strings 
		# 	# no other characters...how?!?!
		end
	end

	# def evaluate_guess(user_input)
	# 	pass in all messages as methods
	#   user_entry_valid? continue to whats below
	# 	if guess == generated_sequence
	# 		"You've won, would you like to play again?" # followed by option to p or q
	# 	elsif 
	# 	else guess != generated_sequence
	# 		"Guess again" #also display message 
	# 		@guess_count -= 1
	# 	end
	# end

end

# Test with this:

# mm = Mastermind.new

# message = mm.user_entry_valid?("rby")

# print = Response.new

# puts print.send(message)


#puts mm.color_shuffle
