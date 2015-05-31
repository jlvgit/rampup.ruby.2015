require 'gosu'
require './kayak'
require './rocks'

class Game < Gosu::Window
  	W = 640
  	H = 480
  def initialize
    super W, H
    @background = Gosu::Image.new("images/rapids.jpg")
    @kayak = Kayak.new
    @rock = Rock.new
    self.caption = "Ultimate Game of Greatest Awesomeness"
  end

  def update
  	@kayak.update
  	@rock.update
  end

  def draw
  	@background.draw(0,-200,-1,0.25,0.25)
  	@kayak.draw
  	@rock.draw
  end
end

window = Game.new
window.show