# require "pry"
require_relative "./robot.rb"
require_relative "./interface.rb"

class Controller
	def initialize(row=5 ,column=5)
		@row = row
		@column = column
		@interface = Interface.new()
		@robot = Robot.new()
	end

	def main_controller
		data = @interface.get_data

		valid_data = data_processing(data)
		
		if !(valid_data.is_a?(Array)) 
			return "Error: Can not read data."
		end

		valid_data.each do |command|
			case command
			when /^PLACE [0-9]+,[0-9]+,(NORTH|SOUTH|EAST|WEST)$/
				command.sub!("PLACE ","")
				command_arr = command.split(",")
				place_robot(command_arr[0].to_i,command_arr[1].to_i,command_arr[2])
			when /^MOVE$/
				move()
			when /^LEFT$/
				turn("LEFT")
			when /^RIGHT$/
				turn("RIGHT")
			when /^REPORT$/
				show_place_to_interface()
			end
		end
	end

	def data_processing(data)
		if !data.is_a?(Array) 
			return "ERROR: invalid command"
		else
			first_place_index = data.find_index { |e| e.match(/^PLACE [0-9]+,[0-9]+,(NORTH|SOUTH|EAST|WEST)$/)}
			if first_place_index == nil
				return "ERROR: user did not place robot on table"
			else
				return data.slice(first_place_index,data.length)
			end
		end
	end

	def place_robot(x, y, direction)
		if !valid_place?(x, y)
			return "Error: Invalid place"
		end

		@robot.x = x
		@robot.y = y
		@robot.angle = direction_translate(direction)

		return show_place()
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

		return show_place()
	end

	def turn(direction)
		x = @robot.x
		y = @robot.y
		angle = @robot.angle

		if direction == "LEFT"
			@robot.angle = angle - 90
		else
			@robot.angle = angle + 90
		end

		return show_place()
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
		return report_object
	end

	def show_place_to_interface
		@interface.report(show_place())
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


# binding.pry

