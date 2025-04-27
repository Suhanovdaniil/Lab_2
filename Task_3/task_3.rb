# Функция для вычисления суммы и произведения цифр числа
def calculate_sum_and_product(n)
    sum = 0
    product = 1
    number_string = n.to_s # Преобразуем число в строку

    number_string.each_char do |digit_char|
        digit = digit_char.to_i # Преобразуем символ цифры в число
        sum += digit
        product *= digit
    end
    return sum, product
end

# Ввод чисел из стандартного ввода
print "Введите числа через пробел: "
input = gets.chomp
number_strings = input.split(" ") # Разбиваем строку на массив чисел
numbers = number_strings.map(&:to_i).filter { |n| n.is_a? Integer } # Преобразуем строки в числа

# Обрабатываем каждое введенное число
numbers.each do |n|
    sum, product = calculate_sum_and_product(n) # Получаем сумму и произведение
    difference = (sum - product).abs # Вычисляем модуль разности

    # Формируем вывод разложения
    number_str = n.to_s
    sum_expression = number_str.chars.map(&:to_i).join(' + ')
    product_expression = number_str.chars.map(&:to_i).join(' * ')

    puts "#{sum} #{product} #{difference} (#{sum_expression} = #{sum}; #{product_expression} = #{product}; |#{sum} - #{product}| = #{difference})"
end
