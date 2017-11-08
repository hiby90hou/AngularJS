module Helper
	#class method
	def self.distance(obj1, obj2)
		Math.sqrt((obj1.x - obj2.x) ** 2 + (obj1.y - obj2.y) ** 2)
	end
	# instance method
	def shif_right(x,y,z=0)
		return x + 3, y, z
	end
	#mixin Ruby Module --mix method into class
	#class Point
	# include Helper
	#end

	#include只能将module中的实例方法mixin进来 变成自己的实例方法
	#class method不能mixin

	# 实例方法使用extend mixin到Point就变成class method
	#class Point
	# extend Helper
	#end
	# 之后可以使用Point.shift_right(1,2)
end