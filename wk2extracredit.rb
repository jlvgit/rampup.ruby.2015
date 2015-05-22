
def price_of_gold_from_pounds pounds
	gold = 133600
	ounces = pounds * 16
	price = ounces * gold
	puts "#{pounds} lbs of gold is worth $#{price/100} dollars"
end

print "How many pounds of gold do you have?"
price_of_gold_from_pounds gets.to_i