def score( dice )
  # Fill me in!
  result = 0
  dice.sort!
  arr1 = dice.select do |elem|
    elem == 1
  end
  if arr1.length >=3
    result += 1000
    dice = dice - [1,1,1]
  end
  
  arr6 = dice.select do |elem|
    elem == 6
  end
  if arr6.length >=3
    result += 600
    dice = dice - [6,6,6]
  end
  
  arr5 = dice.select do |elem|
    elem == 5
  end
  if arr5.length >=3
    result += 500
    dice = dice - [5,5,5]
  end

  arr4 = dice.select do |elem|
    elem == 4
  end
  if arr4.length >=3
    result += 400
    dice = dice - [4,4,4]
  end
  
  arr3 = dice.select do |elem|
    elem == 3
  end
  if arr3.length >=3
    result += 300
    dice = dice - [3,3,3]
  end
  
  arr2 = dice.select do |elem|
    elem == 2
  end
  if arr2.length >=3
    result += 200
    dice = dice - [2,2,2]
  end

  arrs1 = dice.select do |elem|
    elem == 1
  end
  result += 100 * arrs1.length

  arrs5 = dice.select do |elem|
    elem == 5
  end
  result += 50 * arrs5.length
  return result
end
