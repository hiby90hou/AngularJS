require 'pry'

class Robot
	def initialize
		name =""
		2.times{name << ((rand(2)==1?65:97) + rand(25)).chr}
		3.times{name << rand(9).to_s}
		
		@name = name
		@instruction_count = 0
		@boot_time = Time.now
		@create_time = Time.now
	end

	def name
		@instruction_count = @instruction_count + 1
		return @name
	end

	def reset
		name =""
		2.times{name << ((rand(2)==1?65:97) + rand(25)).chr}
		3.times{name << rand(9).to_s}
		@name = name
		@instruction_count = @instruction_count+1
		@boot_time = Time.now
	end

	def instruction_count
		return @instruction_count
	end

	def timers
		boot = Time.now.to_i - @boot_time.to_i
		create = Time.now.to_i - @create_time.to_i
		return "#{boot} seconds since last boot, #{create} seconds since creation"
	end

end

puts "Robot 1: "
robot1 = Robot.new
puts robot1.name
puts robot1.name
puts robot1.name

puts "Robot 2: "
robot2 = Robot.new
puts robot2.name
puts robot2.name
puts robot2.name

puts "Robot 3: "
robot3 = Robot.new
puts robot3.name
puts robot3.name
puts "Resetting to factory settings."
robot3.reset
puts robot3.name
puts robot3.name
puts robot3.instruction_count

puts "Robot 4: "
robot4 = Robot.new
puts robot4.timers # => "21 seconds since last boot, 21 seconds since creation"
puts robot4.name
puts "Resetting to factory settings."
robot4.reset
puts robot4.timers # => "8 seconds since last boot, 29 seconds since creation"
puts robot4.name

binding.pry