require_relative 'wb_lib.rb'

word = ['STEAD']

word.each do |word|
	weights = balance(word)
	weights[:balanced] ? display_success(weights,word) : display_fail(weights,word)
end	