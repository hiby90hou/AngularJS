# File <IO <Object

File.superclass
#=>IO
File.superclass.superclass
#=>Object

# 常用方法
full_name='/Users/Administrator/Desktop/file_util.rb'
File.basename(full_name)
#=>"file_util.rb"
File.basename(full_name,'.rb')
#=>'file_util'
File.dirname(full_name)
#=>"/Users/Administrator/Desktop"
File.extname(full_name)

File.join('home','maizi',code)
File.expand_path("~/ruby")
#=>"Users/admin/ruby"

#文件路径的navigation
#当前路径
Dir.pwd

# 更换所在路径
Dir.chdir('./maizi_code')

#列出当前路径下所有的文件
Dir.entries(".")

#只显示当前路径下的rb文件
Dir['#.rb']

File.exist?('abc.rb')
File.directory?(directory_name)
File.file?(file_name)
File.size(f)

#iterating file
#拿到所有.rb文件
Dir['maizi_code/*.rb']
#对于每一个file进行操作
Dir.glob('maizi_code/*.rb') {|f| load f}

#生成file
Dir.mkdir('tmp')
Dir.rmdir('tmp')
File.rename('test','new_test')
File.delete(file_name)

File.symlink('test', 'old_test')

# 读写文件

File.open('file_name','r'){do_sth}
File.open('file_name','w'){do_sth}

#手动打开 关闭file
begin
	f = File.open('test.rb')
rescue
	puts "This file don't exist"
ensure
	f.close if f
end

File.open('file_util.rb','r') do |f|
	while line=f.gets
		puts line
	end
end

File.open('test','r') do |f|
	lines = f.readlines
end

File.readlines('file_util.rb')

File.read('file_util.rb')

#写文件
File.open('test','w') do |f|
	f << 'hello'
	f << 'world'
	f.puts 'hello'
end