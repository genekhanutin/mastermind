  require 'minitest/autorun'
  require 'minitest/pride'
  require './lib/response'
  require './lib/guess_checker'

  class GuessCheckerTest < Minitest::Test


  def test_it_exists
    gc = GuessChecker.new
    assert
  end

  def test_it_has_a_maximum_amount_of_guesses
    gc = GuessChecker.new
    assert_equal 15, gc.guess_count
  end

  def test_it_prompts_with_error_message_when_guess_too_long
    mm = Mastermind.new
    assert_equal Response.too_many_char, mm.evaluate_entry("rrbby")
    assert_equal Response.too_many_char, mm.evaluate_entry("rrbbyr")
    assert_equal Response.too_many_char, mm.evaluate_entry("rrbbggy")
  end

  def test_it_prompts_with_error_message_when_guess_too_short
    mm = Mastermind.new
    assert_equal Response.not_enough_char, mm.evaluate_entry("rb")
    assert_equal Response.not_enough_char, mm.evaluate_entry("r")
    assert_equal Response.not_enough_char, mm.evaluate_entry("rby")
  end

  def test_it_confirms_colors_entered_are_correct
  	mm = Mastermind.new
  	assert_equal nil, mm.evaluate_entry("rrrr")
    assert_equal nil, mm.evaluate_entry("rgyb")
    assert_equal Response.color_unknown, mm.evaluate_entry('orrr')
    assert_equal Response.color_unknown, mm.evaluate_entry('rrro')
    assert_equal Response.color_unknown, mm.evaluate_entry('rxxr')
  end

  def test_evaluate_positions_returns_number_of_correct_positions
    mm = Mastermind.new
    assert_equal 2, mm.evaluate_correct_positions("byrb", "yyrg")
    assert_equal 1, mm.evaluate_correct_positions("byrb", "yyyy")
    assert_equal 0, mm.evaluate_correct_positions("ryrr", "gbgb")
    assert_equal 3, mm.evaluate_correct_positions("ybgb", "gbgb")
    assert_equal 2, mm.evaluate_correct_positions("rbrb", "gbgb")
    assert_equal 4, mm.evaluate_correct_positions("gbgb", "gbgb")
  end

  def test_evaluate_colors_returns_number_of_correct_colors
    mm = Mastermind.new
    assert_equal 4, mm.evaluate_correct_colors("rrbg", "rrbg")
    assert_equal 0, mm.evaluate_correct_colors("gbgb", "yyyy")
    assert_equal 2, mm.evaluate_correct_colors("bggr", "brrr")
    assert_equal 3, mm.evaluate_correct_colors("bgbr", "bgbg")
    assert_equal 1, mm.evaluate_correct_colors("gyyy", "bgbg")
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
