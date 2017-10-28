# 1.重新认识Module
# Module 是类的父

# # ruby没有命名空间 Namespace
# 类放在Module中来避免同名类冲突
# Module相当于命名空间

# 使用场景：
# Devise

# User
# include Devise::login

#2.Mix-in
#include
#extend

module First
	A=1
	def greet
		p "greet"
	end
end

module Second
	B=2
	#模块自己的方法self. 永远不能被混入
	def self.hello
		p "hello"
	end
end

class Student
	#include会把方法派到实例方法中去
	include First
	#extend 会把方法派到类方法中去
	extend First
	extend Second
	def initialize(no)
		@no=no
	end
end
