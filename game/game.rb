require 'gosu'
require './kayak'
require './rocks'
require './music'

class Game < Gosu::Window
  	W = 640
  	H = 480
  def initialize
    super W, H
    @background = Gosu::Image.new("images/rapids.jpg")
    @kayak = Kayak.new
    @rocks = []
    @music = Gosu::Song.new("./Nano.wav")
    @spawnRate = 0.01
    self.caption = "Ultimate Game of Greatest Awesomeness"
  end

  def update
  	if rand < @spawnRate
  		@rocks << Rock.new
  	end

  	@kayak.update
  	
  	@rocks.each do |rock|
	  	rock.update
	  	if collision? @kayak, rock
	  		puts "Collision!"
	  	end

	  	if rock.y > W
	  		@rocks.delete(rock)
	  	end
	end
  end

  def draw
  	@background.draw(0,-200,-1,0.25,0.25)
  	@kayak.draw
  	@rocks.each do |rock|
	  	rock.draw
	end
  end

  def collision? rock, kayak
  	rock.center_x > kayak.x1 &&
  	rock.center_x < kayak.x2 &&
  	rock.center_y > kayak.y1 &&
  	rock.center_y < kayak.y2
  end
end

window = Game.new
window.show