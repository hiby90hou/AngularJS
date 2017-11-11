# Threas < object

# Thread.new {do_some_thing}

# def foo
# 	10.times {puts "Call foo at #{Time.now}"}
# 	sleep(0.5)
# end

# def bar
# 	10.times {puts "Call bar at #{Time.now}"}
# 	sleep(0.5)
# end

# p '*'*10 + 'start' + '*'*10
# t1 = Thread.new {foo()}
# t2 = Thread.new {bar()}
# t1.join
# t2.join
# p '*'*10 + 'end' + '*'*10

# # Thread.current hash

# count = 0
# arr = []
# 10.times do |i|
# 	arr[i] = Thread.new {
# 		sleep(rand(0)/10.0)
# 		Thread.current["count"] = count
# 		count+=1
# 	}
# end

# arr.each {|t| t.join; print t["count"],","}
# puts "count = #{count}"

# # Thread priority
# count1 = count2 = 0
# a = Thread.new do
# 	loop {count1 +=1}
# end
# a.priority = -1


# b = Thread.new do
# 	loop {count2 +=1}
# end
# b.priority = -2
# sleep 1
# puts count1,count2

# Thread exception
# 任意一个thread发生exception 都会退出
# Thread.abort_on_exception = true
# t1 = Thread.new do
# 	puts "In new thread"
# 	raise "Exception from thread"
# end
# sleep(1)

# puts "not reached"

# Mutext
# count1=count2=0
# difference = 0
# counter = Thread.new do
# 	loop do
# 		count1 +=1
# 		count2 +=1
# 	end
# end

# spy = Thread.new do
# 	loop do
# 		difference +=(count1-count2).abs
# 	end
# end

# sleep 2
# p "count1 :  #{count1}"
# p "count2 :  #{count2}"
# p "difference : #{difference}"

# mutex 锁
mutex = Mutex.new

count1=0
count2=0
difference = 0
counter = Thread.new do
	loop do
		mutex.synchronize do
			count1 +=1
			count2 +=1
		end
	end
end

spy = Thread.new do
	loop do
		mutex.synchronize do
			difference +=(count1-count2).abs
		end
	end
end
sleep 2
mutex.lock
p "count1 :  #{count1}"
p "count2 :  #{count2}"
p "difference : #{difference}"