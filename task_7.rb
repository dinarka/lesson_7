=begin
Подсчет очков игры в дартс

Написать метод score_throws, который принимает массив радиусов броска
(значения радиусов могут быть целыми числами и/или флоатами (числами с плавающей точкой))
и возвращает общее количество очков, вычисляемое по следующей схеме:

    Радиус больше 10 - 0 очков
    Радиус между 5 и 10 (включительно) - 5 очков
    Радиус меньше 5 - 10 очков


Примеры:
score_throws([1, 5, 11]) => 15
score_throws([1, 7, 10, 15]) => 20

Если все радиусы меньше 5 - прибавить к общему счету 100 бонусных очков.
Если в метод передается пустой массив - он должен вернуть 0.
=end

def score_throws(radiuses)
  return 0 if radiuses.empty?

  n = 0
  total = 0
  points = []

  radiuses.each do |radius|
    points << 5 if radius >= 5 && radius <= 10
    points << 10 if radius < 5
  end

  p points

  if points.empty?
    p "Вы не набрали очков"

  else
    points.each do |point|
      n += 1 if point == 10
    end

    total = points.inject(:+)
    total += 100 if n == points.length

    puts "Общее количество очков: #{total}"
  end
end

puts "Введите радиусы броска:"
user_input = gets.chomp.to_s
throws_radius = user_input.split.map { |number| number.to_i }

score_throws(throws_radius)
