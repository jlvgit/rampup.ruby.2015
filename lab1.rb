def c2f temp
	temp * 9/5 + 32
end

def f2c temp
	(temp - 32) * 5/9
end

puts "\nGive me a temperature in Celcius"
C = gets.chomp.to_f
puts "#{C} degrees Celcius is #{c2f C} degrees in Fahrenheit\n\n"

puts "Give me a temperature in Fahrenheit"
F = gets.chomp.to_f
puts "#{F} degrees Fahrenheit is #{(f2c F).round(2)} degrees in Celcius"