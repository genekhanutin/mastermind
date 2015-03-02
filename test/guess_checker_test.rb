  require 'minitest/autorun'
  require 'minitest/pride'
  require './lib/response'
  require './lib/guess_checker'

  class GuessCheckerTest < Minitest::Test

  def test_it_has_a_maximum_amount_of_guesses
    gc = GuessChecker.new("bgbg")
    assert_equal 15, gc.guess_count
  end

  def test_it_prompts_with_error_message_when_guess_too_long
    gc = GuessChecker.new("yyyy") 
    assert_equal Response.too_many_char, gc.evaluate_guess("rrbby")
  end

  def test_it_prompts_with_error_message_when_guess_too_short
    gc = GuessChecker.new("yyyy")
    assert_equal Response.not_enough_char, gc.evaluate_guess("rb")
  end

  def test_it_confirms_colors_entered_are_correct
    gc = GuessChecker.new("bbbb")
    assert_equal Response.color_unknown, gc.evaluate_guess("opqs")
  end

  def test_evaluate_positions_returns_number_of_correct_positions
    gc = GuessChecker.new("yyyy")
    assert_equal 1, gc.evaluate_correct_positions("byrb", "yyyy")
    gc = GuessChecker.new("gbgb")
    assert_equal 4, gc.evaluate_correct_positions("gbgb", "gbgb")
  end

  def test_evaluate_colors_returns_number_of_correct_colors
    gc = GuessChecker.new("rrbg")
    assert_equal 4, gc.evaluate_correct_colors("rrbg", "rrbg")
    gc = GuessChecker.new("yyyy")
    assert_equal 0, gc.evaluate_correct_colors("gbgb", "yyyy")
    gc = GuessChecker.new("bgbg")
    assert_equal 3, gc.evaluate_correct_colors("bgbr", "bgbg")
    gc = GuessChecker.new("bgbg")
    assert_equal 1, gc.evaluate_correct_colors("gyyy", "bgbg")
  end
end
