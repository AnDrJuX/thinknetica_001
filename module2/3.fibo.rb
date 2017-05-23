c = 0
fibo = [0,1]

loop do
  c = fibo[fibo.length - ((fibo[2].to_i / 2) + 1)] + fibo.last
  break if c > 100
  fibo.push(c)
end

puts fibo
