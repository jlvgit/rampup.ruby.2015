require 'gosu'
require './cards'
require './media'

class Game < Gosu::Window
  	W = 640
  	H = 480
  def initialize
    super W, H
    @x = 240
    @dx = 240
    @z = 1
    @victory = nil
    @wins = 0
    @losses = 0
    @stand = "no"
    self.caption = "Blackjack"
    
    #player hand cards
    @pHand = newCard + newCard
    @pScore = [@pHand[1], @pHand[3]]

    #dealer hand cards
    @dHand = newCard + newCard
    @dScore = [@dHand[1], @dHand[3]]

    #font for score and w/l ratio
    @font = Gosu::Font.new(20)

	#sound effects
    @effect = Gosu::Sample.new("sounds/cardPlace1.wav")
    @winSound = Gosu::Sample.new("sounds/111.wav")
    @loseSound = Gosu::Sample.new("sounds/114.wav")
    @tieSound = Gosu::Sample.new("sounds/109.wav")

    #Win/loss banner images
    @winText = Gosu::Image.new("images/win.png")
    @loseText = Gosu::Image.new("images/lose.png")
    @tieText = Gosu::Image.new("images/tie.png")

    #green background image and red card back for dealer
    @background = Gosu::Image.new("images/felt.png")
    @card = Cards.new
    @cardback = @card.cardback     

    #background music   
    @music = Gosu::Song.new("sounds/casino.ogg")   
    @music.play(true)
  end

  #generates a random card image and gives it a value
  def newCard
	@card = Cards.new
  	@card.random
  end

  #checks arrays for the ace value of 11 and converts it to a 1 if needed
  def check4aces num
  	num.each do |x|
		if x == 11
			@pScore.delete(11)
			@pScore << 1
		end
	end
  end

  #compares the player hand and the dealer hand and determines the winner
  def winner phand, dhand
	if phand > dhand && phand <= 21
		@victory = "yes"
		@winSound.play
		@wins += 1
	elsif dhand > phand && dhand <= 21
		@victory = "no"
		@loseSound.play
		@losses += 1
	elsif dhand > 21 && phand <= 21
		@victory = "yes"
		@winSound.play
		@wins += 1
	else
		@tieSound.play
		@victory = "tie"
	end
  end


  def button_down(id)

  	#resets all the variables to the default in order to play a new hand
  	if id == Gosu::KbEscape
      @pHand = newCard + newCard
      @dHand = newCard + newCard
      @pScore = [@pHand[1], @pHand[3]]
      @dScore = [@dHand[1], @dHand[3]]
      @cardback = @card.cardback
      @victory = nil
      @stand = "no"
      @x = 240
      @dx = 240
      @z = 0
    end

    #freezes player actions and draws dealer cards until dealer is over 17 then compares totals to determine winner
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

    #adds a card to the players hand, if player goes over 21 it gives them a game over
  	if id == Gosu::KbSpace && @pHand.length < 10 && @stand == "no" && @pScore.inject(:+) < 22
  		@pHand += newCard
		@pScore << @pHand[-1]
		if @pScore.inject(:+) > 21
			check4aces @pScore
			if @pScore.inject(:+) > 21
				@victory = "no"
				@losses += 1
				@loseSound.play
			end
		end
  		@effect.play(volume = 3, speed = 1, looping = false)
	end

  end

  def draw
  	#draws the background and the plain text such as scores and w/l ratio
  	@background.draw(0,0,0)
  	@font.draw("W: #{@wins} L: #{@losses}", 10, H/2, 1)
  	@font.draw("Total: #{@dScore.inject(:+)}", 285, 10, 1) if @stand == "yes"
	if @pScore.inject(:+) <= 21
		@font.draw("Total: #{@pScore.inject(:+)}", 285, 460, 1)
	else 
		@font.draw("Bust!", 300, 460, 1)
		@victory = "no"
		@stand = "yes"
	end
	
	#draws all the player cards on the board
	@pHand[0].draw(@x,350,1)
  	@pHand[2].draw(@x+90,350,1)
	@pHand[4].draw(@x+180,350,1) if @pHand.length >= 6
	@pHand[8].draw(@x+360,350,1) if @pHand.length >= 10
	if @pHand.length >= 8 
		@x = 150
		if @pHand.length >= 10
			@x=100
		end
		@pHand[6].draw(@x+270,350,1)
	end

	#draws the dealer cards on the board
  	@dHand[0].draw(@dx+90,45,1)
  	@dHand[2].draw(@dx,45,@z)
  	@cardback.draw(240,45,1)
	@dHand[4].draw(@dx+180,45,2) if @dHand.length >= 6
	@dHand[8].draw(@dx+360,45,2) if @dHand.length >= 10
	if @dHand.length >= 8
		@cardback = @dHand[0]
		@dx = 150
		if @dHand.length >= 10
			@dx=100
		end		
		@dHand[6].draw(@dx+270,45,2)
	end

	#pops up the different win/loss banners
	case @victory
	  when "no" then @loseText.draw(200,120,3,0.75,0.75)
	  when "yes" then @winText.draw(50,100,3,0.5,0.5)
	  when "tie" then @tieText.draw(175,130,3,0.4,0.4)
	end

  end
end

window = Game.new
window.show