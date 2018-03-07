class Interface

	def read_file(filePath)
		if !File.exist?(filePath)
			raise ("ERROR: file do not exist.")
		end

		data = []
		File.open(filePath, "r") do |f|
		  f.each_line do |line|
		    data.push(line.upcase.chomp)
		  end
		end

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

	def get_data
		puts "Please input file path"
		filePath = gets.chomp
		data = read_file(filePath)

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