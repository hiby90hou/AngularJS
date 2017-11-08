module Helper
	#instance_method
	def shift_right(x,y,z = 0)
		return x+3, y, z
	end

	module ClassMethods
		def distance(obj1,pbj2)
			Math.aqrt((obj1.x - obj2.x) ** 2 + (obj1.y - obj2.y) ** 2)
		end
	end

	# when included in klass, the hook is called
	def self.included(klass)
		klass.extend ClassMethods
	end
end

class Point
	include Helper
end

#当前class mix 了那些module
# Point.included_modules

# 判断某一个module是否included
# Point.included?(Helper)

#只取继承结构
# Point.ancestors - Point.included_modules

#class和module的不通点：module不能有实例化对象