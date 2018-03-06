require "pry"
class Robot
	attr_accessor :x, :y, :angle
	def initialize(x=0,y=0,angle=0)
		@x = x
		@y = y
		@angle = angle
	end
end

class Controller
	def initialize(row=5 ,column=5)
		@row = row
		@column = column
		@interface = Interface.new()
		@robot = Robot.new()
	end

	def main_controller
		data = @interface.get_data
		if data == nil
			return "error: no valid command"
		end

		first_place_index = data.find_index { |e| e.match( /^PLACE [0-9]+,[0-9]+,(NORTH|SOUTH|EAST|WEST)$/ ) }
		if first_place_index == nil
			return "error: user did not place robot on table"
		end

		valid_data = data.slice(first_place_index,data.length)
		valid_data.each do |command|
			case command
			when /^PLACE [0-9]+,[0-9]+,(NORTH|SOUTH|EAST|WEST)$/
				command.sub!("PLACE ","")
				command_arr = command.split(",")
				place_robot(command_arr[0].to_i,command_arr[1].to_i,command_arr[2])
			when /^MOVE$/
				move()
			when /^LEFT$/
				turn("left")
			when /^RIGHT$/
				turn("right")
			when /^REPORT$/
				show_place()
			end
		end
	end

	def place_robot(x, y, direction)
		if !valid_place?(x, y)
			return
		end

		@robot.x = x
		@robot.y = y
		@robot.angle = direction_translate(direction)
	end

	def move
		x = @robot.x
		y = @robot.y
		angle = @robot.angle

		if show_direction(angle) == "NORTH" && can_go_north?(x, y)
			@robot.y = y+1
		elsif show_direction(angle) == "EAST" && can_go_east?(x, y)
			@robot.x = x+1
		elsif show_direction(angle) == "SOUTH" && can_go_south?(x, y)
			@robot.y = y-1
		elsif show_direction(angle) == "WEST" && can_go_west?(x, y)
			@robot.x = x-1
		end
	end

	def turn(direction)
		x = @robot.x
		y = @robot.y
		angle = @robot.angle

		if direction == "left"
			@robot.angle = angle - 90
		else
			@robot.angle = angle + 90
		end
	end

	def direction_translate(direction)
		case direction.upcase
		when "NORTH"
			return 0
		when "EAST"
			return 90
		when "SOUTH"
			return 180
		when "WEST"
			return 270
		end
	end

	def show_place
		direction = show_direction(@robot.angle)
		report_object = {"x":@robot.x, "y":@robot.y, "dir":direction}
		@interface.report(report_object)
	end

	def show_direction(angle)
		if angle%360 == 0
			return "NORTH"
		elsif angle%360 == 90
			return "EAST"
		elsif angle%360 == 180
			return "SOUTH"
		elsif angle%360 == 270
			return "WEST"
		else
			return "error direction"
		end
	end

	def valid_place?(x, y)
		return (x >= 0 && x < @row &&
			y >= 0 && y < @column)
	end

	def can_go_north?(x, y)
		return y + 1 < @column
	end

	def can_go_east?(x, y)
		return x + 1 < @row
	end

	def can_go_south?(x, y)
		return y - 1 >= 0
	end

	def can_go_west?(x, y)
		return x - 1 >= 0
	end
end

class Interface

	def read_file(filePath)
		data = []
		File.open(filePath, "r") do |f|
		  f.each_line do |line|
		    data.push(line.upcase.chomp)
		  end
		end
		return data
	end

	def get_data
		puts "Please input file path"
		filePath = gets.chomp
		data = read_file(filePath)

		data.map! do |command|
			if is_place?(command) || is_move?(command) || is_left?(command) || 
				is_right?(command) || is_report?(command)
				command
			else
				nil
			end
		end

		data.compact!

		return data
	end

	def is_place?(command)
		!!(command =~ /^PLACE [0-9]+,[0-9]+,(NORTH|SOUTH|EAST|WEST)$/)
	end

	def is_move?(command)
		!!(command =~ /^MOVE$/)
	end

	def is_left?(command)
		!!(command =~ /^LEFT$/)
	end

	def is_right?(command)
		!!(command =~ /^RIGHT$/)
	end

	def is_report?(command)
		!!(command =~ /^REPORT$/)
	end
	
	def report(data_object)
		puts "#{data_object[:x]},#{data_object[:y]},#{data_object[:dir]}"
	end
end

binding.pry