def calc (rent, rm, util)
	(rent + util)/rm
end
puts calc(2700, 4, 47.38).round(2)

puts "name?"
name = gets.chomp
puts name*5