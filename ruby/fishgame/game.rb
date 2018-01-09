require 'pry'

fish = {
	name: 'nemo',
	health: 10
}

def move
end

class Fish # Class name always starts with Capital and camel case
	def initialize(name,health)
		@name = name #local variable only lives as the method is being run
		@health = health
	end

	def sleep # Instance method
		@health = @health + 10
	end

	def name
		return @name
	end

	def set_name(new_name)
		@name = new_name
	end

end

class Shark
	def initialize
		@health = 1000
	end
end

binding.pry

puts 'paused'