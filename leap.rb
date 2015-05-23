leap_years = []
print "Give me a starting year. >"
start = gets.to_i
print "Now give me an ending year. >"
ending = gets.to_i
years = start..ending
array = years.to_a
array.each do |stuff|
	if stuff%4 == 0
		leap_years.push(stuff)
	end
end
leap_years.each do |stuff|
	if stuff%400 != 0 && stuff%100 == 0
		leap_years.delete(stuff)
	end
end
puts "\nThe leap years between #{start} and #{ending} are #{leap_years}"