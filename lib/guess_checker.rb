require_relative 'response'
require_relative 'mastermind'


class GuessChecker

	attr_reader :generated_sequence, :guess_count
	

	def initialize(generated_sequence)
		@generated_sequence = generated_sequence
		@colors = ['r','g','b','y']
		@guess_count = 4
	end

	def evaluate_guess(guess)
    if guess.length > 4
      Response.too_many_char
    elsif guess.length < 4
      Response.not_enough_char
    elsif !all_chars_valid?(guess)
      Response.color_unknown
    elsif winning_guess?(guess)
    	Response.win_play_again(@guess_count) 
      Mastermind.new.start_game
    elsif guess_count == 1
      Response.lose_message(@generated_sequence)
      Mastermind.new.start_game
    else
    	evaluate_correct_colors(guess)
      evaluate_correct_positions(guess)
      @guess_count -= 1
      notify_correct_colors_positions
    end
  end

  def notify_correct_colors_positions
  	feedback = [Response.num_correct_positions_message(@correct_position_count),
    Response.num_correct_colors_message(@correct_color_count), 
    Response.guess_again(@guess_count)] 
    feedback.join("\n")	
  end

  def winning_guess?(user_guess)
    user_guess == generated_sequence
  end

  def all_chars_valid?(user_input)
    user_input.each_char.all? do |letter|
      @colors.include?(letter)
    end
  end

  def evaluate_correct_colors(user_input, color_code = generated_sequence)
    @correct_color_count = 0
    generated_sequence = color_code.split("")
    guess = user_input.split("").each do |color|
      if generated_sequence.include?(color)
        generated_sequence.delete_at(generated_sequence.index(color))
        @correct_color_count += 1
      end
    end
    @correct_color_count
  end

  def evaluate_correct_positions(user_input, color_code = generated_sequence)
    @correct_position_count = 0
    guess = user_input.split("")
    generated_sequence = color_code.split("")
    guess.each_with_index do |color, position|
      if color == generated_sequence[position]
        @correct_position_count += 1
      end
    end
    @correct_position_count
  end
end