require './lib/mastermind'


mm = Mastermind.new


puts Response.welcome_message
puts Response.instructions_message
start_time = Time.now

input = ""

while input != "q"
  mm.start_game
end
