# input = gets.to_i


# if input == 2
# 	puts "2相等"
# elsif input ==3
# 	puts "3相等"
# else
# 	puts "不等"
# end

# puts "0相等" if input == 0

#与if相反
# unless input =="100"
# 	puts "123"
# else
# 	puts "321"
	
# end

# switch语句

# object = gets.to_i
# case object
# #取1和2
# when 1..2
# 	puts "1到2"
# #取4,5,6,7
# when 4...8	
# 	puts "4到7"
# end

#循环
# input = gets.chomp.to_i
# while input!=0
#  	puts "hehe"
# 	break if input ==2
#  end

# until input!=0
# 	puts "haha"
# end

#数值迭代器
# sum = 0
# (1..5000).each{|i|
# 	sum+=i
# }

# puts sum

#异常处理
# a = 100

# while true
# 	b = gets.to_i
# 	begin
# 		puts a/b
# 	rescue Exception => e
# 		puts e
# 		puts "输入的是0"
# 	end
# end

# 方法
# gets是被调用的方法 返回值是a
# a=gets
# #to_i方法将a转换为数组
# a.to_i
# puts a

#导入ruby文件
#》irb
#》require '文件路径' 运行test
# def test
# 	puts "test"
# end
# def add(a =3,b=2)
# 	return a+b
# end

# 类和模块
#》"abc".class
  # => String
#》String.class
  # =>Class
# 1 2 3 数字类
# 'a' 'b' 'c' 字符串类
# new字符串
# a =String.new
 #=>""
# a = String.new("33")
 #=>"33"

# 类的关键字是class
# 使用a=Student.new("Bob","1","男") 建立新元素
# class Student
# 	def initialize(name,no,gender)
# 		@name = name
# 		@no = no
# 		@gender = gender
# 	end

# 	def sayHi
# 		puts "我叫#{@name},学号是#{@no}"
# 	end
# end

#自定义类
# class Student
# 	#类常量
# 	#》Student::Version 调用类常量
# 	Version = "1.0"
# 	#简单的实现getter setter
# 	attr_accessor :name
# 	#只和读不可写
# 	attr_reader :no
# 	#只可写不可读
# 	attr_writer :gender

# 	def initialize(name,no,gender)
# 		@name = name
# 		@no = no
# 		@gender = gender
# 	end
# 	# #setter 存值
# 	# #"name="中间不能有空格
# 	# def name=(name)
# 	# 	@name=name
# 	# end

# 	# #getter 取值
# 	# def name
# 	# 	return @name
# 	# end



# 	def sayHi
# 		puts "我叫#{@name},学号是#{@no}"
# 	end

# 	#方法的访问控制 public(默认) private
# 	private
# 	def sayHi2
# 		puts "2.我叫#{@name},学号是#{@no}"
# 	end
# end

#类方法
class Student
	attr_accessor :name
	attr_reader :no
	attr_writer :gender

	def initialize(name, no, gender)
		@name = name
		@no = no
		@gender = gender
	end
    #类方法
	def say_hello
		puts "2.我叫#{@name},学号是#{@no}"
	end

	#实例方法
	#用Student.nick_name调用
	def self.nick_name
		return "学生类"
	end
end

# 类的继承(用<表示)
class UniStudent < Student
	def sayEnglish
		puts "Hello world"
	end
end

# 扩充类
class Student
	def say_hello
		p "hello"
	end
end

# 扩充类2
class String
	def self.nick_name
		p "small S"
	end

	def self.name
		p "字符串类" 
	end
end

# 模块(没有实例new方法 不能继承)
# Math::PI
# Math.sqrt(2)
# Math::sqrt(2)

#模块是不能实例化的