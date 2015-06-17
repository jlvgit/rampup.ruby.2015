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
    @winSound = Gosu::Sample.new("sounds/111.wav")
    @loseSound = Gosu::Sample.new("sounds/114.wav")
    @tieSound = Gosu::Sample.new("sounds/109.wav")
    @winText = Gosu::Image.new("images/win.png")
    @loseText = Gosu::Image.new("images/lose.png")
    @tieText = Gosu::Image.new("images/tie.png")
    @music = Gosu::Song.new("sounds/casino.ogg")
    @music.play(true)
    @victory = "nothing"

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

  def winner phand, dhand

	if phand > dhand && phand <= 21
		puts "You have #{phand}, Dealer has #{dhand}. You win!"
		@victory = "yes"
		@winSound.play

	elsif dhand > phand && dhand <= 21
		@victory = "no"
		@loseSound.play
	elsif dhand > 21
		@victory = "yes"
		@winSound.play
	else
		@tieSound.play
		@victory = "tie"
	end
  end

  def button_down(id)
  	if id == Gosu::KbEscape
      @pHand = newCard + newCard
      @dHand = newCard + newCard
      @pScore = [@pHand[1], @pHand[3]]
      @dScore = [@dHand[1], @dHand[3]]
      @victory = "nothing"
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
  			@effect.play(volume = 1, speed = 1, looping = false)    		
    	end

    	if @dScore.inject(:+) > 21
    		check4aces @dScore
    	end
    	winner @pScore.inject(:+), @dScore.inject(:+)
    end

  	if id == Gosu::KbSpace && @pHand.length < 10 && @stand == "no" && @pScore.inject(:+) < 22
  		@pHand += newCard
		@pScore << @pHand[-1]
		if @pScore.inject(:+) > 21
			check4aces @pScore
		end
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
  	if @stand == "yes"
  		@font.draw("Total: #{@dScore.inject(:+)}", 285, 10, 1)
  	end
	if @pScore.inject(:+) <= 21
		@font.draw("Total: #{@pScore.inject(:+)}", 285, 460, 1)
	else 
		@font.draw("Bust!", 300, 460, 1)
		@victory = "no"
		@stand = "yes"
	end
	
	if @pHand.length >= 6
		@pHand[4].draw(@x+180,350,1)
	end
	if @pHand.length >= 8 
		@x = 150
		if @pHand.length >= 10
			@x=100
		end
		@pHand[6].draw(@x+270,350,1)
	end
	if @pHand.length >= 10
		@pHand[8].draw(@x+360,350,1)
	end
	if @dHand.length >= 6
		@dHand[4].draw(200,150,1)
	end
	if @dHand.length >= 8
		@dHand[6].draw(290,150,1)
	end
	if @dHand.length >= 10
		@dHand[8].draw(380,150,1)
	end

	case 
	  when @victory == "no"
	 	@loseText.draw(200,120,3,0.75,0.75)
	  when @victory == "yes"
		@winText.draw(50,100,3,0.5,0.5)
	  when @victory == "tie"
		@tieText.draw(175,130,3,0.4,0.4)
	end

  end

end

window = Game.new
window.show