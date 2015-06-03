def draw
	rand(1..10)
end

def suit
	suit = ["spades", "clubs", "diamonds", "hearts"]
	return suit[rand(4)]
end

def winner phand, dhand

	if phand > dhand && phand <= 21
		puts "You have #{phand}, Dealer has #{dhand}. You win!"
	elsif dhand > phand && dhand <= 21
		puts "You have #{phand}, Dealer has #{dhand}. You lose."
	elsif dhand > 21
		puts "You win!"
	else
		puts "Push. Nobody wins. Take your money back and try again."
	end
end

game = 0

puts "Play? 1 = yes, 2 = no"
game = gets.chomp.to_i

while game != 1 && game != 2 	
	puts "Thats not a 1 or a 2. Try again. Want to play? 1 = yes, 2 = no"
	game = gets.chomp.to_i
end

while game == 1
	hand = [draw, draw]
	dand = [draw, draw]
	puts "\nYou get two cards, #{hand[0]} of #{suit} and #{hand[1]} of #{suit}. Your total is #{hand.inject(:+)}."
	puts "The dealer is showing a #{dand[0]} of #{suit}. Would you like another card?\n1 = yes, 2 = no"
	hit = gets.chomp.to_i

	while hit == 1
		hand << draw
		puts "You draw a #{hand[-1]} of #{suit}. Your total is #{hand.inject(:+)}."

		if hand.inject(:+) == 21
			puts "You have 21!\n\n"
			hit = 2
		elsif hand.inject(:+) > 21
			puts "Bust. Dealer wins by default."
			game = 0
			break
		elsif hand.inject(:+) < 21
			puts "Want another card? 1 = yes, 2 = no."
			hit = gets.chomp.to_i

		end
	end
		
	while hit == 2 && hand.inject(:+) <= 21
		puts "Dealer flips his second card. It's a #{dand[1]} of #{suit}. Dealer total is #{dand.inject(:+)}."
		until dand.inject(:+) >= 17 
			dand << draw
			sleep(1)
			puts "Dealer draws another card it's a #{dand[-1]} of #{suit}. Dealer total is #{dand.inject(:+)}."
			if dand.inject(:+) > 21
				puts "Dealer busts."
				hit = 0
			else
				hit = 1
			end
		end
	winner hand.inject(:+), dand.inject(:+)
	end

	puts "\nPlay again? 1 = yes, 2 = no"
	game = gets.chomp.to_i

end

if game == 2
	puts "Ok then bye"
end

