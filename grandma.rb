
bye = 0
puts "Hi Sonny, how are you?"
talk = gets.chomp
while bye == 0
	if talk == "BYE"
		puts "Oh Sonny please don't go.".upcase
		talk = gets.chomp
		if talk == "BYE"
			puts "I'm begging you please don't leave, stay here and comfort grandma.".upcase
			talk = gets.chomp
			if talk == "BYE"
				puts "OK! GET LOST, GRANDMA IS GONNA GO GIVE GRANDPA HIS VIAGRA NOW"
				bye = 1
			end
		end
	elsif talk == talk.upcase
		puts "NO, NOT SINCE #{rand(50)+1930}"
	else 
		puts "HUH?!, SPEAK UP SONNY!"
	end
	talk = gets.chomp
end