require 'date'
require 'prime'

current_year = Time.now.year

$i=99
$num=0

until $num>$i
	if Date.leap?(current_year-$i)
		puts (current_year-$i)
	end
	$i-=1
end

$j=0
$big_num=200
$flag = false
until $j>$big_num
	puts "#{$j}*7 = #{$j*7}"
	if $j.odd?
		if $flag
			puts "#{$j} is second odd"
		end
		$flag = !$flag
	end

	if $j.prime?
		puts "#{$j} is prime"
	end
	$j+=1
end