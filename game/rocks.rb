class Rock
	def initialize
		@image = Gosu::Image.new("images/bear.png")
		@width = @image.width
		@height = @image.height
		@x = Game::W
		@y = rand(Game::H)
		@z = 1
	end

	def update
		@x -= 4
	end

	def draw
  		@image.draw(@x,@y,@z,0.5,0.5)
	end


end