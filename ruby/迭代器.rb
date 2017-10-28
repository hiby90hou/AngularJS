#迭代器
5.times {
	p "hello"
}

5.times {|n|
	p n
}

#数组中的调用
a = [1,2,3,4,5]
a.each{
	|n|
	p n
}

#哈希
a = {"a"=>"b","c"=>2}
a.each{
	|key,value|
	p "#{key}:#{value}"
}

a = [1,2,3,4,5]
p a.sort{|a,b|
	#大的在前小的在后
	b<=>a
}

 p a

 class Book
 	attr_accessor :title, :author
 	def initialize(title,author)
 		@author = author
 		@title = title
 	end
 end

 class BookList
 	def initialize()
 		@book_list = Array.new
 	end

 	def add(book)
 		@book_list.push(book)
 	end

 	def length
 		@book_list.length
 	end

 	def [](n)
 		@book_list[n]
 	end

 	def []=(n,book)
 		@book_list[n] = book
 	end

 	def delete(book)
 		@book_list.delete(book)
 	end

 	def each_title
 		@book_list.each{|book|
 			#yield可以定义自己的内容
 			yield(book.title)

 		}
 	end
 end

# BookList.new.each_title{ |title|
# 	p title
# }