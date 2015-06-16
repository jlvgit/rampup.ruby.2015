class Cards
	def initialize
		@imagesuits = ["c","d","h","s"]
		@imagenumbers = ["1","2","3","4","5","6","7","8","9","10","j","k","q"]
		@score = 0
		@cardback = Gosu::Image.new("images/b2fv.png")
	end

	attr_accessor :cardback

	def update

	end


	def random
		@drawncard = @imagenumbers[rand(0..12)]
		@drawncardsuit = @imagesuits[rand(0..3)]
		@cardValue = @drawncard.to_i
		if @cardValue == 0
			@cardValue = 10
		elsif @cardValue == 1
			@cardValue = 11
		end

		@random_card = Gosu::Image.new("images/#{@drawncardsuit}#{@drawncard}.png")	
		return [@random_card, @cardValue]
	end

	def draw
		
	end
end