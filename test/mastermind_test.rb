require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require './lib/response'

class MastermindTest < Minitest::Test
  

  def test_it_exists
    assert MastermindTest
  end

  def test_it_can_generate_random_order_of_four_colors
    mm = Mastermind.new

    sequence1 = mm.color_shuffle
    sequence2 = mm.color_shuffle

    refute sequence1 == sequence2
  end

  def test_it_can_take_in_a_guess
  	skip
  	mm = Mastermind.new

  	assert_equal "rrby", mm.guess("rrby")
  end

  def test_it_counts_number_of_guesses
  	skip
  end

  def test_it_has_a_maximum_amount_of_guesses
    skip
    mm = Mastermind.new

    assert_equal "You lose!"
  end

  def test_it_can_take_in_a_guess
    mm = Mastermind.new

    assert_equal "rbyb", mm.guess("rbyb")
  end

  def test_it_prompts_with_error_message_when_guess_too_long
    mm = Mastermind.new

    assert_equal :too_many_char, mm.user_entry_valid?("rrbby")
  end

  def test_it_prompts_with_error_message_when_guess_too_short
    mm = Mastermind.new

    assert_equal :not_enough_char, mm.user_entry_valid?("rb")
  end

  def test_it_confirms_colors_entered_are_correct
  	skip
  	mm = Mastermind.new
  	assert true, mm.correct_colors?
  end

   def test_when_colors_are_correct_it_prompts_the_user_with_a_message
   	# message gives number of correct colors
  	skip
  end

  def test_when_order_is_correct_it_prompts_user_with_a_message
  	# message gives number of correct positions
  	skip
  end

  def test_it_can_evaluate_correct_order
  	skip
  	mm = Mastermind.new
  	assert 
  end

  def test_when_colors_and_order_are_correct_user_wins
  	skip
  end

  def test_it_has_a_start_time
  	# Time begins after first guess
  	skip
  end

  def test_it_has_a_final_time
  	# Time ends when user wins, runs out of guesses
  	skip
  end

  def test_it_prints_game_statistics_after_game_is_over
  	skip
  end
  
end
