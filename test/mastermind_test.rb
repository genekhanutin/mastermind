  require 'minitest/autorun'
  require 'minitest/pride'
  require './lib/mastermind'
  require './lib/response'
  require './lib/guess_checker'

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
end

