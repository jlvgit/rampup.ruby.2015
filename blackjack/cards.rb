class Cards
	def initialize
		@x = 200
		@y = 200
		@z = 1
		@imagesuits = ["c","d","h","s"]
		@imagenumbers = ["1","2","3","4","5","6","7","8","9","10","j","k","q"]
		@card = []
		@drawncard = @imagenumbers[rand(0..13).round]
		@drawncardsuit = @imagesuits[rand(0..3)]
		@cardValue = @drawncard.to_i
		if @cardValue == 0
			@cardValue = 10
		end
		
		@cardback = Gosu::Image.new("images/b2fv.png")
		@random_card = Gosu::Image.new("images/#{@drawncardsuit}#{@drawncard}.png")
	end

	def update
	end

	def random
		@random_card
	end

	def draw
		
	end
end