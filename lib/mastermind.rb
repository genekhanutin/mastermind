require_relative 'response'
require_relative 'guess_checker'
require 'pry'

class Mastermind
  
  attr_reader :correct_color_count,
              :correct_position_count,
              :generated_sequence
              

  attr_accessor :guess

  def initialize
    @colors = ['r','g','b','y']
    @generated_sequence = nil
  end

  def start_game
    user_input = gets.chomp.downcase
    if user_input == "p" 
      color_shuffle
      puts Response.generated_sequence_guess_message
      @guess = gets.chomp.downcase
      gc = GuessChecker.new(@guess, @generated_sequence)
      gc.evaluate_guess
    elsif user_input == "q"
      exit_game
    else
      puts Response.unknown_input 
    end
  end

  def color_shuffle
    @generated_sequence = (@colors * 5).sample(4).join
  end

  def exit_game
    puts Response.goodbye_message
    exit
  end

end


