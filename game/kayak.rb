class Kayak
	def initialize
		@image = Gosu::Image.new("images/Fish.png")
		@width = @image.width
		@height = @image.height
		@x = Game::W/2 - @width/2
		@y = Game::H-@height
		@z = 1
	end
	
	def update
			if Gosu::button_down? Gosu::KbLeft
				@x -= 5
			elsif Gosu::button_down? Gosu::KbRight
				@x += 5
			elsif Gosu::button_down? Gosu::KbUp
				@y -= 5
			elsif Gosu::button_down? Gosu::KbDown
				@y += 5	
			end

	end


	def draw
  		@image.draw(@x,@y,@z,0.5,0.5)
  	end
end

