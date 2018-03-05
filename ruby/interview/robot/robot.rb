require "pry"
class Robot
	def initialize(x=0,y=0,f=0)
		@x = x
		@y = y
		@f = f
	end

	def get_x
		return @x
	end

	def get_y
		return @y
	end

	def get_f
		return @f
	end

	def set_x new_x
		@x = new_x
	end

	def set_y new_y
		@y = new_y
	end

	def set_f new_f
		@f = new_f
	end

	# def move
	# 	can_move = Valid_action.new(@x,@y)
	# 	if can_move.valid_place? == false
	# 		return
	# 	end

	# 	if is_north? && can_move.can_go_north?
	# 		@y = @y+1
	# 	elsif is_east? && can_move.can_go_east?
	# 		@x = @x+1
	# 	elsif is_south? && can_move.can_go_south?
	# 		@y = @y-1
	# 	elsif is_west? && can_move.can_go_west?
	# 		@x = @x-1
	# 	end
	# end

	# def turn(direction)
	# 	can_turn = Valid_action.new(@x,@y)
	# 	if !can_turn.valid_place?
	# 		return
	# 	end
	# 	if direction == "left"
	# 		@f = @f - 90
	# 	else
	# 		@f = @f + 90
	# 	end
	# end

	# def report
	# 	return {"x"=>@x,"y"=>@y,"face"=>@f}
	# end
end

class Controller
	def initialize(row=5 ,column=5)
		@row = row
		@column = column
	end

	def place_robot(x, y, f)
		@robot = Robot.new(x, y, f)
	end

	def move
		x = @robot.get_x
		y = @robot.get_y
		f = @robot.get_f

		if !valid_place?(x, y)
			return
		end

		if show_direction(f) == "NORTH" && can_go_north?(x, y)
			@robot.set_y(y+1)
		elsif show_direction(f) == "EAST" && can_go_east?(x, y)
			@robot.set_x(x+1)
		elsif show_direction(f) == "SOUTH" && can_go_south?(x, y)
			@robot.set_y(y-1)
		elsif show_direction(f) == "WEST" && can_go_west?(x, y)
			@robot.set_x(x-1)
		end
	end

	def turn(direction)
		x = @robot.get_x
		y = @robot.get_y
		f = @robot.get_f
		
		if !valid_place?(x, y)
			return
		end

		if direction == "left"
			@robot.set_f(f - 90)
		else
			@robot.set_f(f + 90)
		end
	end

	def show_place
		direction = show_direction(@robot.get_f)
		return {"x":@robot.get_x, "y":@robot.get_y, "dir":direction}
	end

	def show_direction(f)
		if f%360 == 0
			return "NORTH"
		elsif f%360 == 90
			return "EAST"
		elsif f%360 == 180
			return "SOUTH"
		elsif f%360 == 270
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

	def initialize
		@controller = Controller.new
	end

	def read_file(fileName = "./test/input.txt")
		@data = []
		File.open("./test/input.txt", "r") do |f|
		  f.each_line do |line|
		    puts line
		    @data.push(line.chomp)
		  end
		end
	end

	def run_command
		@data.each do |command|
			if command =~ /^PLACE */
				command.sub!("PLACE ","")
				command_arr = command.split(",")
				@controller.place_robot(command_arr[0].to_i,command_arr[1].to_i,direction_translate(command_arr[2]))
			elsif command =~ /^MOVE$/
				@controller.move
			elsif command =~ /^LEFT$/
				@controller.turn("left")
			elsif command =~ /^RIGHT$/
				@controller.turn("right")
			elsif command =~ /^REPORT$/
				place = @controller.show_place
				puts "#{place[:x]},#{place[:y]},#{place[:dir]}"
			end
		end
	end

	def direction_translate(direction)
		if direction.upcase == "NORTH"
			return 0
		elsif direction.upcase == "EAST"
			return 90
		elsif direction.upcase == "SOUTH"
			return 180
		elsif direction.upcase == "WEST"
			return 270
		else
			return "error"
		end
	end
end
binding.pry