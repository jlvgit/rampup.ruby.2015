class Music
	def initialize
		@music = Gosu::Song.initialize("./Nano.wav")
	end

	def play
		@music.play(volume= 1, speed = 1, looping = true)
	end
end