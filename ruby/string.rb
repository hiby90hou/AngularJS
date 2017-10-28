数组类（array）
创建数组
numbers = [1,2,3,4,5]

numbers = Array.new
numbers[1]=1



常用方法
numbers.length
numbers.empty?

a = [1,2,3]
b = [2,3,4]

a & b
=>[2,3]

a | b
=>[1,2,3,4]

a + b
=>[1,2,3,2,3,4]

a.push(5)
=>[1,2,3,5]
a.pop(3)
=>[1,2,3]

a.insert(1,100)
=>[1,100,2,3]

a.delete(100)
=>[1,2,3]

哈希类
hashes = {"a"=>"b"}
hashes["a"]
=>"b"
a=Hash.new
a["a"]=2
a["b"]=2
a.to_a
=>[["a",2]["b",2]]

a.to_a.to_h
=>{"a"=>2,"b"=>2}

文件类
File FileUtils
重命名：
File.rename("class.rb","c.rb")
复制文件：
require "FileUtils"
FileUtils.cp("c.rb","c_1.rb")
删除文件：
File.delete("c_1.rb")

文件夹类
Dir
打开目录
打印出文件名：
dir= Dir.open("../Desktop")
while file_name = dir.read
	p file_name
end
新建文件夹：
Dir.mkdir("temp")
删除文件夹(文件夹不空则不能删除):
Dir.delete("temp")


时间类
Time

Time.new
=>获取时间

Time.now
=>获取现在时间

t=Time.now
t.year
t.month
t.day

#一年中的第几天
t.yday

Time.now.to_s
#自定义时间格式
Time.new.strftime("%Y/%m/%d %H:%M:%S")

require 'date'
Date.today
Date.today.year
#可进行运算
Date.today+3

DateTime