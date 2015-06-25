class Player
	def initialize
		@image = Gosu::Image.new("media/ship.gif")
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@score = 0
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def turnL
		@angle -= 4.5
	end

	def turnR
		@angle += 4.5
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, 0.5)
		@vel_y += Gosu::offset_y(@angle, 0.5)
	end

	def move
		@x += @vel_x
		@y += @vel_y
		@x %= 640
		@y %= 480

		@vel_x *= 0.95
		@vel_y *= 0.95
	end

	def draw
		@image.draw_rot(@x, @y, 1, @angle)
	end

	def score
		@score
	end

	def collect (stars)
		stars.reject! do |star| 
			if Gosu::distance(@x, @y, star.x, star.y) < 35 then
				@score += 10
			end
		end
	end
end
