# 逻辑运算符
# 真：不是nil 不是false
# 假：nil或者false
# 与运算&& 真&&假=假
# 或运算|| 真||假=真

# 条件运算符
# (必须注意空格)
#   条件式
# c=(a>b) ? a : b
# 范围运算符
# ..
# a[0..4]
# 输出a[]的前5个字符
# >=0 <=4
# ...
# a[0...4]
# >=0 <4

# 输出a[]的前4个字符

# 自定义符号(自定义方法名)
class Vector
	attr_reader :x, :y
	def initialize(x, y)
		@x = x
		@y = y
	end

	def +(the_vector)
		Vector.new(@x+the_vector.x, @y+the_vector.y )
	end

	def -(the_vector)
		Vector.new(@x-the_vector.x, @y-the_vector.y )
	end
end