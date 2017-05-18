puts "Настало время узнать всё про твой треугольник!"
puts "Какова длина первой его стороны?"
a = gets.chomp.to_f
puts "Какова длина второй стороны?"
b = gets.chomp.to_f
puts "Какова длина третьей стороны?"
c = gets.chomp.to_f

all_sides = [a,b,c].sort

min_side = all_sides[0]
mid_side = all_sides[1]
max_side = all_sides[2]

if (min_side**2 + mid_side**2) == max_side**2
  puts "Поздравляю, ваш треугольник прямоугольный!"
  if (min_side == max_side) || (min_side == mid_side) || (mid_side == max_side)
    puts "Так же ваш треугольник еще и равнобедренный!"
  end
else
  if (min_side == max_side) && (mid_side == max_side)
    puts "Ваш треугольник равнобедренный и равносторонний, но не прямоугольный."
  else
    if (min_side == max_side) || (min_side == mid_side) || (mid_side == max_side)
      puts "Ваш треугольник равнобедренный, но не равносторонний и не прямоугольный"
    else
      puts "Ваш треугольник не равнобедренный, не равносторонний и не прямоугольный :("
    end
  end
end
