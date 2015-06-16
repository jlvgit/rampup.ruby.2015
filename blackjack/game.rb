require 'gosu'
require './cards'

class Game < Gosu::Window
  	W = 640
  	H = 480
  def initialize
    super W, H
    @x = 240
    @y = 350
    @z = 1
    @stand = "no"
    @background = Gosu::Image.new("images/felt.png")
    self.caption = "Blackjack"
    @card = Cards.new
    @cardback = @card.cardback
    
    @pHand = newCard + newCard
    @dHand = newCard + newCard

    @pScore = [@pHand[1], @pHand[3]]
    @dScore = [@dHand[1], @dHand[3]]
    @font = Gosu::Font.new(20)
    @effect = Gosu::Sample.new("sounds/cardPlace1.wav")
    @music = 
    @noOfCard = 2
  end

  def newCard
	@card = Cards.new
  	@card.random
  end

  def check4aces num
  	num.each do |x|
		if x == 11
			@pScore.delete(11)
			@pScore << 1
		end
	end
  end

  
  def update

  end

  def button_down(id)
  	if id == Gosu::KbEscape
      @pHand = newCard + newCard
      @dHand = newCard + newCard
      @pScore = [@pHand[1], @pHand[3]]
      @dScore = [@dHand[1], @dHand[3]]
      @noOfCard = 2
      @stand = "no"
      @x = 240
      @z = 0
    end

    if id == Gosu::KbS
    	@z = 2
    	@stand = "yes"

    	until @dScore.inject(:+) >= 17
    		@dHand += newCard
    		@dScore << @dHand[-1]
    		if @dScore.inject(:+) > 21
    			check4aces @dScore
    		end
    	end
    end

  	if id == Gosu::KbSpace && @noOfCard < 5 && @stand == "no"
  		@pHand += newCard
		@pScore << @pHand[-1]
		if @pScore.inject(:+) > 21
			check4aces @pScore
		end
		@noOfCard += 1
  		@effect.play(volume = 1, speed = 1, looping = false)
	end

  end

  def draw
  	@background.draw(0,0,0)
  	@pHand[0].draw(@x,350,1)
  	@pHand[2].draw(@x+90,350,1)
  	@dHand[0].draw(330,45,1)
  	@dHand[2].draw(240,45,@z)
  	@cardback.draw(240,45,1)  
	if @pScore.inject(:+) <= 21
		@font.draw("Total: #{@pScore.inject(:+)}", 285, 460, 1)
	else 
		@font.draw("Bust!", 300, 460, 1)
	end
	
	if @noOfCard >= 3
		@pHand[4].draw(@x+180,350,1)
	end
	if @noOfCard >= 4 
		@x = 150
		if @noOfCard >= 5
			@x=90
		end
		@pHand[6].draw(@x+270,350,1)
	end
	if @noOfCard >= 5
		@pHand[8].draw(@x+360,350,1)
	end

  end

end

window = Game.new
window.show