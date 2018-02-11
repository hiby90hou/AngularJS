def sum_dig_pow(a, b)
  # your code here
  result = []
  (a..b).each do |num|
    tmpArr = num.to_s.split('')
    sum = 0
    tmpArr.each_with_index do |inner_num,index|
      sum += inner_num.to_i ** (index+1)
    end
    if sum == num
      result.push(num)
    end
  end
  return result
end
