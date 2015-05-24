def jumble string,shift,type
	array = string.split ""
	encrypted = []
	if type == 2
		mix_up = array.map { |letter| letter.ord - shift}
	else mix_up = array.map { |letter| letter.ord + shift}
	end
	mix_up.each do |k|
		encrypted.push(k.chr)
	end
	puts "Your encrypted code is #{encrypted.join.to_s}"
end

puts "Give me a string."
user_string = gets.chomp
puts "Give me a shift amount"
user_shift = gets.chomp.to_i
puts "Are you 1)Encoding or 2)Decoding?"
choice = gets.chomp.to_i
jumble user_string,user_shift,choice