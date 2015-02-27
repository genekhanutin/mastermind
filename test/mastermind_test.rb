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
  	mm = Mastermind.new
  	assert_equal "rrby", mm.guess("rrby")
  end

  def test_it_counts_number_of_guesses
    # everytime evaluate guess is called guess count -1
    # after every guess display message showing correct pos. count
    # correct color count, guess again, and number of guesses left
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
    assert_equal :too_many_char, mm.evaluate_entry("rrbby")
    assert_equal :too_many_char, mm.evaluate_entry("rrbbyr")
    assert_equal :too_many_char, mm.evaluate_entry("rrbbggy")
  end

  def test_it_prompts_with_error_message_when_guess_too_short
    mm = Mastermind.new
    assert_equal :not_enough_char, mm.evaluate_entry("rb")
    assert_equal :not_enough_char, mm.evaluate_entry("r")
    assert_equal :not_enough_char, mm.evaluate_entry("rby")
  end

  def test_it_confirms_colors_entered_are_correct
  	mm = Mastermind.new
  	assert_equal nil, mm.evaluate_entry("rrrr")
    assert_equal nil, mm.evaluate_entry("rgyb")
    assert_equal :color_unknown, mm.evaluate_entry('orrr')
    assert_equal :color_unknown, mm.evaluate_entry('rrro')
    assert_equal :color_unknown, mm.evaluate_entry('rxxr')
  end

  def test_evaluate_positions_returns_number_of_correct_positions
    mm = Mastermind.new
    assert_equal 2, mm.evaluate_positions("byrb", "yyrg")
    assert_equal 1, mm.evaluate_positions("byrb", "yyyy")
    assert_equal 0, mm.evaluate_positions("ryrr", "gbgb")
    assert_equal 3, mm.evaluate_positions("ybgb", "gbgb")
    assert_equal 2, mm.evaluate_positions("rbrb", "gbgb")
    assert_equal 4, mm.evaluate_positions("gbgb", "gbgb")
  end

  def test_evaluate_colors_returns_number_of_correct_colors
    # to test guessing and getting feedback about # of overlapping
    # set up a mastermind instance
    # some way to set up the code for the game
    # set up a guess against that code where we have 2 of the correct color
    # call evaluate_guess and pass in our guess
    # verify it comes back saying 2 colors are correct
    mm = Mastermind.new
    assert_equal 4, mm.evaluate_colors("rrbg", "rrbg")
    assert_equal 0, mm.evaluate_colors("gbgb", "yyyy")
    assert_equal 2, mm.evaluate_colors("bggr", "brrr")
    assert_equal 3, mm.evaluate_colors("bgbr", "bgbg")
    assert_equal 1, mm.evaluate_colors("gyyy", "bgbg")
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
