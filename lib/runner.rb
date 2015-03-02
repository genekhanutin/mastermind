require './lib/mastermind'

puts Response.welcome_message
puts Response.instructions_message

Mastermind.new.start_game

