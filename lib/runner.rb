require './lib/mastermind'

puts Response.welcome_message
puts Response.instructions__start_message

Mastermind.new.start_game

