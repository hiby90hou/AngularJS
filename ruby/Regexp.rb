# 定义reg 正则
#1 /ruby/
#2 %r{ruby}
#3 Regexp.new

# Basics
text =~ /Ruby/  # Match for an unbound literal
text =~ /^Ruby/  # Match literal at start of string
text =~ /Ruby$/  # Match literal at end of string
text =~ /^Ruby$/  # Match for exact string content
text =~ /^$/  # Match empty string

# metacharacters
text =~ /r.*y/
text =~ /r.?y/
text =~ /r.*?y/
text =~ /r\w*y/
text =~ /\w+/

# options
text =~ /Ruby/i
text =~ /r.*y/im

#parenthesis, bracket and braces
text =~ /r[abc]y/
text =~ /r(.*)y/

# ruby中使用reg
#1.判断string是否match reg
'abcd'.match(/a.*c/)
#或
'abcd' =~ /a.*c/

#2.
a[/[aeiou](.)\1/]

#3. 分割和替换字符串
'(200)959-5592'.split(/[\(\)-]/).reject {|e| e.empty?}