require_relative 'response'
require_relative 'mastermind'
require 'pry'

class GuessChecker

	attr_reader :generated_sequence, :guess_count
	attr_accessor :guess

	def initialize(guess, generated_sequence)
		@guess = guess
		@generated_sequence = generated_sequence
		@colors = ['r','g','b','y']
		@guess_count = 15
	end

	def evaluate_guess
    loop do
      if guess.length > 4
        puts Response.too_many_char
        notify_and_reset_guess
      elsif guess.length < 4
        puts Response.not_enough_char
        notify_and_reset_guess
      elsif !all_chars_valid?(guess)
        puts Response.color_unknown
        notify_and_reset_guess
      elsif !winning_guess?(guess)
      	evaluate_correct_colors(guess)
      	evaluate_correct_positions(guess)
        @guess_count -= 1
        notify_correct 
        notify_and_reset_guess   
      else
        puts Response.win_play_again
      end
    end
  end

  def notify_and_reset_guess
  	puts Response.guess_again(guess_count)
    @guess = gets.chomp.downcase
  end

  def notify_correct
  	puts Response.num_correct_positions_message(@correct_position_count)
    puts Response.num_correct_colors_message(@correct_color_count) 
  end

  def winning_guess?(user_guess)
    end_time = Time.now
    user_guess == generated_sequence
  end

  def all_chars_valid?(user_input)
    user_input.each_char.all? do |letter|
      @colors.include?(letter)
    end
  end

  def evaluate_correct_colors(user_input, color_code = generated_sequence)
  	binding.pry
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
  	binding.pry
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