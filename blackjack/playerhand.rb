require 'cards'

class PlayerHand
	def intialize
		@cardValue = @drawncard.to_i
		if @cardValue == 0
			@cardValue = 10
		end
		@random_card = Gosu::Image.new("images/#{@drawncardsuit}#{@drawncard}.png")
		@card << @cardValue << @random_card
	end
end

puts PlayerHand