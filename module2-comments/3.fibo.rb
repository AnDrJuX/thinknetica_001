a = 0
b = 1
c = 0
fibo = []

while c < 100 do
    fibo.push(c)
    c = a+b
    a = b
    b = c
end

puts fibo
