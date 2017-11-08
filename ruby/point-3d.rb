class Point3D < point
	def initialize(x = 0, y = 0, z = 0)
		# @x, @y, @z = x, y, z
		super(x,y)
		@z = z
	end
end
# ruby允许继承private method

# Method Visibility
#           Visibility       inheritance   call on Object
#public    in/out of class    Yes              Yes

#protected within             Yes              Yes

#private   within             Yes              No

# is_a?（是class的实例或者是父class的实例 就返回true） and instance_of?(只有当前obj是这个类的一个实例化对象 才会返回true)

# p = Point3D.new(2,3,1)

# p.is_a? Point

# p.is_a? Point3D

# p.instance_of? Point

# p.instance_of? Point3D

# Point3D.superclass

# Point3D.ancestors