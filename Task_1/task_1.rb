def get_river_crossing_result
  print "Введите общее количество валунов (stones): "
  stones = gets.chomp.to_i # Читаем количество валунов

  print "Введите количество птиц (N): "
  n = gets.chomp.to_i # Читаем количество птиц

  print "Введите дальность полета для каждой из #{n} птиц через пробел: "
  birds = gets.chomp.split.map(&:to_i) # Читаем дальности полета

  visited_stones = [false] * stones # Создаем массив для отслеживания посещенных валунов.
                                   # Изначально все значения false

  # Моделируем перелеты птиц
  birds.each do |range|
    (range - 1).step(stones - 1, range) do |i|
      visited_stones[i] = true # Помечаем валун как посещенный
    end
  end

  unvisited_count = visited_stones.count(false) # Считаем непосещенные валуны
  return unvisited_count # Возвращаем количество непосещенных валунов
end

result = get_river_crossing_result # Вызываем функцию
puts "Количество валунов, на которых не появится ни одной птицы: #{result}" # Выводим результат
