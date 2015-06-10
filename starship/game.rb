require 'gosu'
require './player'

class GameWindow < Gosu::Window
	def initialize
		super 640, 480
		self.caption = "Stars and stuff"

		@background = Gosu::Image.new("media/stars.jpg")

		@player = Player.new
		@player.warp(320, 240)

		@star_anim = Gosu::Image.new("media/star.png")
		@star = Array.new
	end

	def update
		if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then @player.turnL
		end
		if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then @player.turnR
    	end
    	if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then @player.accelerate
    	end
    	@player.move
    	@player.collect(@stars)

    	if rand(100) < 4 and @stars.size < 25 then
    		@star.push(Star.new(@star_anim))
    	end 
    end


	def draw
		@player.draw
		@background.draw(0,0,0,0.5,0.5)
		@stars.each { |star| star.draw}
	end
	
	def button_down(id)
    	if id == Gosu::KbEscape
      		close
    	end
  	end

  	module ZOrder
  		Background, Stars, Player, UI = *0..3
	end
end

window = GameWindow.new
window.show