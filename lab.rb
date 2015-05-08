puts "What is your name?"
name = gets.capitalize.chomp
puts "How old are you?"
age = gets.to_i
current_year = 2015
puts "\n#{name} was born in the year #{current_year-age}. \nUnless #{name} hasn't had their birthday this year. \nIn that case they were born in #{current_year-age-1}"