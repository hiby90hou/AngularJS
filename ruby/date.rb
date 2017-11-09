# require 'date'
# Date.today
# #<Date: 2017-11-09 ((2458067j,0s,0n),+0s,2299161j)>
# DateTime.now
# #<DateTime: 2017-11-09T14:02:14+11:00 ((2458067j,10934s,121845000n),+39600s,2299161j)>
# p Date.today

# p  DateTime.now

# Time.now.class
# #=>Time
# DateTime.now.class
# #=>DateTime
# Date.today.class
# #=>Date
# DateTime.superclass
# #=>Object
# Time.superclass
# #=>object

# date=Date.today
# date.year
# date.month
# date.day
# date.wday
# date.prev_day
# date.next_day

# Date.parse('03/11/2015')
# Date.strptime('15-03-11','%y-%m-%d')

# TRY_FORMATS = ['%d/%m/%y', '%Y %m %d']
# def try_to_parse(s)
# 	parsed = nil
# 	TRY_FORMATS.each do |format|
# 		begin
# 			parsed = Date.strptime(s, format)
# 			break
# 		rescue ArgumentError
# 		end
# 	end
# 	parsed
# end

# #special formate
# Time.iso8601('2001-04-17T19:17.201Z')
# Time.rfc822('Tue,1 Jul 2003 10:52:37 +0200')
# Time.httpdate('Tue, 05 Sep 2006 16:04:51 GMT')

# Time.now.iso8601
# Time.now.to_s
# Time.now.strfttime('%m/%d/%y')


# time = Time.now
# time.hour
# time.min
# time.sec
# time.zone

# # 给time额外的function
 require 'time'

# #Time Zone
# Time.now
# Time.now.isdst #是不是在夏令时中
# Time.now.gmtime #UTC

# DateTime.now.new_offset
# DateTime.now.new_offset(Rational(8,24)) #北京时间
# ENV['TZ'] = 'Asia/Shanghai' #转换时区

#得到当地时间
class Time
	def convert_zone(to_zone)
		original_zone = ENV["TZ"]
		utc_time = dup.gmtime
		ENV["TZ"] = to_zone
		to_zone_time = utc_time.localtime
		ENV["TZ"] = original_zone
		to_zone_time
	end
end

t= Time.at(1000000000)
p t.convert_zone('US/Eastern')
p t.convert_zone("Asia/Shanghai")
