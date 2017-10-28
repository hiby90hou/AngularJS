module Mathematics
	PI = 3.1415
# 只有加上self.的类方法 才能直接调用
	def self.sqrt(number)
		Math.sqrt(number)
	end

	def hello
		p "hello"
	end
end

class Student
	include Mathematics
	def initialize(no)
		@no = no
		
	end
end