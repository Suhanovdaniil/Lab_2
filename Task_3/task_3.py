import math

# Функция для вычисления суммы и произведения цифр числа
def calculate_sum_and_product(n):
    sum_digits = 0
    product_digits = 1
    number_string = str(n) # Преобразуем число в строку

    for digit_char in number_string:
        digit = int(digit_char) # Преобразуем символ цифры в число
        sum_digits += digit
        product_digits *= digit
    return sum_digits, product_digits

if __name__ == "__main__":
    # Ввод чисел из стандартного ввода
    numbers = input("Введите числа через пробел: ").split()
    numbers = [int(n) for n in numbers if n.isdigit()] # Преобразуем строки в числа

    # Обрабатываем каждое введенное число
    for n in numbers:
        sum_digits, product_digits = calculate_sum_and_product(n) # Получаем сумму и произведение
        difference = abs(sum_digits - product_digits) # Вычисляем модуль разности

        # Формируем вывод разложения
        number_str = str(n)
        sum_expression = ' + '.join(number_str)
        product_expression = ' * '.join(number_str)
        print(f"{sum_digits} {product_digits} {difference} ({sum_expression} = {sum_digits}; {product_expression} = {product_digits}; |{sum_digits} - {product_digits}| = {difference})")
