# each: iterator
# |elem|: block
# [1,2,3].each do |elem|
# 	p elem
# end

# 多行代码 使用do
# 一行代码使用{}
# 特殊情况下必须使用{}，因为优先级高

# def foo
# 	a = 2
# 	yield a
# end

# foo { |a| puts a }

# &block调用（将block转换为Proc）
def foo(&block)
	a = 2
	block.call(a)
end

foo { |a| puts a }

# block variable
  # closure
  # definition time
# p a 报错
# foo {|b| p b; p a}
a=4
# block 可以拿到a=4
foo {|b| p b; p a}

#block flow control
 # block return
 # block break, next

 #报错 LocalJumpError
 # foo {|a| p a; return}
 def bar
 	x = 3
 	yield x
 	p 'end of bar'
 end

 def foo
 	p 'start of foo'
 	bar { |x| return if x > 0}
 	p 'end of foo'
 end

# end of foo不会执行
 foo

 # block不是方法 是语法结构
 # return是对方法的操作 对方法退出

# Proc 类
# &定义中 block转proc
# &使用中 proc转block

arr = %w(a b c)
# :capitalize是方法 方法自动转换成proc &将proc转换成block
arr.map(&:capitalize)
"a".capitalize
#=>"A "
#效果相当于
arr.map {|x| x.capitalize}
# proc可以看做block的对象表示
# proc的类是Proc

p= Proc.new { |x,y| p x,y}
p.call(1,2,3)
# 忽略第三个参数
# => [1,2]

#lambda的行为更像方法
lambda = lambda {|x| x * 2}

l = lambda { |x,y| p x,y}

#报错 l.call(1)
#参数必须传2个 不能多传少传

l = lambda { |x,y| return if x>0}
#l.call(1)不报错