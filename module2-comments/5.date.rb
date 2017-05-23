puts 'Введите день'
day = gets.chomp.to_i
puts 'Введите месяц'
month = gets.chomp.to_i
puts 'Введите год'
year = gets.chomp.to_i
months = {jan: 31, feb: 28, mar: 31, apr: 30, may: 31, jun: 30, jul: 31, aug: 31, sep: 30, oct: 31, nov: 30, dec: 31}
index = 0

if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
  months[:feb] = 29
end

i = 0
months.each do |m, d|
  if i == month-1
    break
  end
  i+=1
  index += d
end

index+=day

puts "#{day}.#{month}.#{year} это #{index} день года."
