# 类是容器 装着方法
# 对象是receiver 可以回应方法
class Point # CamelCase --constant
	attr_accessor :x #getter and setter
	attr_reader :y #getter
	#构造函数
	def initialize(x=0,y=0)
		# @x instance实例 variable
		# @@x class cariable
		# $x global variable
		# x local variable
		@x, @y = x, y
	end
	# instance method
	def first_quadrant?
		#相当于self.x self.y
		x>0 && y>0
		# setter不能写成x=3 要写成 self.x=3
	end

	def +(p2)
		Point.new(x+p2.x, y+p2.y)
	end

	# 定义class method
	def self.second_quadrant?(x,y)
		x<0 && y>0
		#这里的self指类
	end

	#定义很多class method
	class << self # 将self赋给class 默认有了self.
		def foo
		end
		def bar
		end
		def wat
		end
	end

end
# p = Point.new(2,3)

# p p.class
# #=>Point

# #反省自己
# p p.methods

# p p.x

# p p.y

# p.x=3
# p p.x

# p p.first_quadrant?

# p1=Point.new(2,3)

# p2 = Point.new(3,4)

# p3 = p1 + p2

# p p3.x

# p p3.y

# p Point.second_quadrant?(-2,3)
