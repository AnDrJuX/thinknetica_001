puts "Настало время узнать каков твой идеальный вес!"
puts "Как тебя звать, человек?"
name = gets.chomp
puts "Каков твой рост, #{name}?"
height = gets.chomp
perfect_weight = height.to_i - 110
if perfect_weight < 0
  puts "Ваш вес уже оптимальный"
else
  puts "#{name}, твой идеальный вес равен #{perfect_weight} кг."
  puts "Есть к чему стремиться!"
end
