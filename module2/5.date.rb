puts 'Введите день'
day = gets.chomp.to_i
puts 'Введите месяц'
month = gets.chomp.to_i
puts 'Введите год'
year = gets.chomp.to_i
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
index = 0

if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
  months[1] = 29
end

i = 0
months.each do |d|
  if months[month-1] == d
    break
  end
  index += d
end

index+=day

puts "#{day}.#{month}.#{year} это #{index} день года."
