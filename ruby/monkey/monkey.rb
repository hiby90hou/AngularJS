class Monkey
	def initialize(name, species)
		@name = name
		@species = species
		@foods_eaten = []
	end

	def eat(food)
		@foods_eaten.push(food)
	end

	def introduce
		# food_string = ""
		# @foods_eaten.each_with_index{|food,index|
		# 	if index==@foods_eaten.length-2
		# 		food_string = food_string + food + " and "
		# 	elsif index==@foods_eaten.length-1
		# 		food_string = food_string + food + ". "
		# 	else
		# 		food_string = food_string + food + " , "	
		# 	end
		# 	}
		food_string = @foods_eaten.join(',')
		food_string.reverse!.sub!(","," dna ").reverse!

		puts "I am " + @name.to_s + ", my species is "+ @species.to_s + ", I eat "+ food_string
	end
end