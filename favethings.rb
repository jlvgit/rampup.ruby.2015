myfavoritethings = ["food","sleep","money","video games","incredible acts of kindness"]

def a_few_of array
	new_array = array[rand(array.length)] << array[rand(array.length)]
	puts new_array
end

a_few_of myfavoritethings