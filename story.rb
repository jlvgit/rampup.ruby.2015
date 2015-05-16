puts """\nYou're a traveler on a long journey. 
After many miles, you come to a fork in the road.
To the North is a small village. to the East is a dark cave.
Which way do you go? North or East?"""

direction = gets.chomp

if direction == "North"
	puts "\nYou head north. Where a dragon awaits, it breathes flame at you. You die."
elsif direction == "East"
	puts "\nYou wander to the east. A giant chasm stands before you. As you gaze into its vastness a giant eagle swoops down and pushes you off the edge. You die."
else puts "\nYou do nothing. You stand there in that spot until you wither and die."
end