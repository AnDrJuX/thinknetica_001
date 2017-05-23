c = 0
fibo = [0,1]

loop do
  c = fibo[fibo.length-2] + fibo.last
  c +=1 if c == 1
  break if c > 100
  fibo.push(c)
end

puts fibo
