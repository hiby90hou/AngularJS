# ruby method
def foo
	puts 'hello World!'
end

# ruby方法的返回值
# 尽量在结尾不要使用return
# 在方法定义的中间少用return

def foo(x)
	return if x.blank? || x.bar? || x.baz?
	wut(x)
	wat(x)
end

#ruby中的self指对象本身
str = 'hello world'
def str.foo
	puts self
end

# ruby中的alias可以给方法起别名
def foo
	puts 'foo'
end

alias :bar :foo

bar
#=>foo

#ruby的operator method
# []
arr = [1,2,3]
arr[2]
#=>3
arr.[](2)
#=>3

#getter setter accessor []

arr = [1,2,3]
arr+[4]

#重新定义运算符
def arr.+(num)
	self.dup << num
end

arr + 5
#=>[1,2,3,5]
arr + 6
#=>[1,2,3,6]

#default Parameter
# ruby没有重载
# flexibility is obtained by default value
foo(a,b,c = 3)

# splat operator(*) in ruby method parameters

# *b 会变成数组
def foo(a, *b,c)
	p a
	p b
	p c
end

foo(1,2,3,4,5)
# 1
# [2,3,4]
# 5
#=>5

# hash
def bar(h)
	h.each do |key,value|
		p key, value
	end
end

bar(a:3, b:4)
#:a
#3
#:b
#4
# =>{:a=>3, :b=>4}

#ruby不能省略括号的情况
#有歧义