  require 'minitest/autorun'
  require 'minitest/pride'
  require './lib/response'
  require './lib/guess_checker'

  class GuessCheckerTest < Minitest::Test


  def test_it_exists
    gc = GuessChecker.new("rgrg","bgbg")
    assert true 
  end

  def test_it_has_a_maximum_amount_of_guesses
    gc = GuessChecker.new("rgrg","bgbg")
    assert_equal 15, gc.guess_count
  end

  def test_it_prompts_with_error_message_when_guess_too_long
    gc = GuessChecker.new("rrbby", "yyyy") 
    assert_equal Response.too_many_char, gc.evaluate_guess
    gc = GuessChecker.new("rrbbyr", "bbbb") 
    assert_equal Response.too_many_char, gc.evaluate_guess
    gc = GuessChecker.new("rrbbggy","bgbg") 
    assert_equal Response.too_many_char, gc.evaluate_guess
  end

  def test_it_prompts_with_error_message_when_guess_too_short
    gc = GuessChecker.new("rb", "yyyy")
    assert_equal Response.not_enough_char, gc.evaluate_guess
    gc = GuessChecker.new("y", "yyyy")
    assert_equal Response.not_enough_char, gc.evaluate_guess
    gc = GuessChecker.new("rry", "yyyy")
    assert_equal Response.not_enough_char, gc.evaluate_guess
  end

  def test_it_confirms_colors_entered_are_correct
    gc = GuessChecker.new("orrr", "bbbb") 
    assert_equal Response.color_unknown, gc.evaluate_guess
    gc = GuessChecker.new("opqs", "bbbb")
    assert_equal Response.color_unknown, gc.evaluate_guess
    gc = GuessChecker.new("orrd", "rrrr")
    assert_equal Response.color_unknown, gc.evaluate_guess
  end

  def test_evaluate_positions_returns_number_of_correct_positions
    gc = GuessChecker.new("byrb", "yyrg")
    assert_equal 2, gc.evaluate_correct_positions("byrb", "yyrg")
    gc = GuessChecker.new("byrb", "yyyy")
    assert_equal 1, gc.evaluate_correct_positions("byrb", "yyyy")
    gc = GuessChecker.new("ryrr", "gbgb")
    assert_equal 0, gc.evaluate_correct_positions("ryrr", "gbgb")
    gc = GuessChecker.new("ybgb", "gbgb")
    assert_equal 3, gc.evaluate_correct_positions("ybgb", "gbgb")
    gc = GuessChecker.new("rbrb", "gbgb")
    assert_equal 2, gc.evaluate_correct_positions("rbrb", "gbgb")
    gc = GuessChecker.new("gbgb", "gbgb")
    assert_equal 4, gc.evaluate_correct_positions("gbgb", "gbgb")
  end

  def test_evaluate_colors_returns_number_of_correct_colors
    gc = GuessChecker.new("rrbg", "rrbg")
    assert_equal 4, gc.evaluate_correct_colors("rrbg", "rrbg")
    gc = GuessChecker.new("gbgb", "yyyy")
    assert_equal 0, gc.evaluate_correct_colors("gbgb", "yyyy")
    gc = GuessChecker.new("bggr", "brrr")
    assert_equal 2, gc.evaluate_correct_colors("bggr", "brrr")
    gc = GuessChecker.new("bgbr", "bgbg")
    assert_equal 3, gc.evaluate_correct_colors("bgbr", "bgbg")
    gc = GuessChecker.new("gyyy", "bgbg")
    assert_equal 1, gc.evaluate_correct_colors("gyyy", "bgbg")
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
