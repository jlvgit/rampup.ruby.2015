require 'gosu'
require './cards'

class Game < Gosu::Window
  	W = 640
  	H = 480
  def initialize
    super W, H
    @background = Gosu::Image.new("images/felt.png")
    self.caption = "Blackjack"
    @card1 = Cards.new
    @card2 = Cards.new
  end

  def update

  end

  def draw
  	@background.draw(0,0,0)
    @card1.random.draw(240,350,1)
    @card2.random.draw(330,350,1)
  end
end

window = Game.new
window.show