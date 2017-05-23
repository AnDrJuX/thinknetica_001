cart = {}
prod_total = 0.0
total = 0.0

puts "Что вы купили?"
answer = gets.chomp.downcase
while answer != 'стоп' do
  prod = answer
  puts "Сколько стоил #{prod}?"
  price = gets.chomp.to_f
  puts "Сколько штук #{prod} вы купили?"
  count = gets.chomp.to_f
  cart[prod] = {price => count}
  puts "Что еще?"
  answer = gets.chomp.downcase
end

puts "------------------------\nЗначит вы купили:"
cart.each do |prod, pc|
  pc.each do |price, count|
    prod_total = price * count
    total += prod_total
    puts "--\n#{prod} по цене #{price} монет, в количестве #{count} штук, на что потратили #{prod_total} монет"
  end
end
puts "------------------------\nНа всё ушло #{total} монет"
