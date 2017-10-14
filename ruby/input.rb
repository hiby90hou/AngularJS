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
a = 100

while true
	b = gets.to_i
	begin
		puts a/b
	rescue Exception => e
		puts e
		puts "输入的是0"
	end
end