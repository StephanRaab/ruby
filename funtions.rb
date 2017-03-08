#functions are easy
def iamafunction(par1, par2)
  puts "The first argument was #{par1}, and the second was #{par2}"
  return nil
end

def addition (x, y)
  x + y
end

def subtraction(first, second)
  while second != 0
    first -= 1
    second -= 1
  end
  return first
end

def sub_recursive(first, second)
  if second != 0
    sub_recursive(first-1, second -1)
  else
    return first
  end
end

puts addition(3,5)

puts subtraction(5,7)
puts subtraction(12,5)

puts sub_recursive(5,7)
puts sub_recursive(12,5)











