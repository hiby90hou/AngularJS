# Metaprogramming 用程序来写程序
# attr_reader :x, :y
# attr_accessor :foo, :bar

# eval
eval "1 + 1" # eval string 做运算
eval "def foo; puts 'foo'; end" #输出

class Adder
	def initialize(x)
		@x=x
	end

	def method_missing(method_name)
		regex = /^plus(\d+)$/
		if method_name =~ regex
			val = method_name[regex,1].to_i
			eval "def #{method_name}; @x + #{val}; end; #{method_name}"
		else
			super
		end
	end
end

# instance_eval 在实例中做eval
String.instance_eval "def foo;puts 'instance_eval foo';end"
#class_eval
String.class_eval "def foo; puts 'class_eval foo';end"
str = 'asdf'

# defind_method
defind_method(:foo) {|arg| puts arg}

defind_method(:bar) {puts 'bar'}

name = nil
[:new, :create, :destory].each do |name|
	define_method("test_#{name}") do
		puts name
	end
end