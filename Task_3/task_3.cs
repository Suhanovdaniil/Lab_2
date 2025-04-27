using System;
using System.Collections.Generic;
using System.Linq;

public class Program
{
    // Функция для вычисления суммы и произведения цифр числа
    static void CalculateSumAndProduct(int n, out int sum, out int product)
    {
        sum = 0;
        product = 1;
        string number = n.ToString(); // Преобразуем число в строку

        foreach (char digitChar in number)
        {
            int digit = digitChar - '0'; // Преобразуем символ цифры в число
            sum += digit;
            product *= digit;
        }
    }

    public static void Main(string[] args)
    {
        List<int> numbers = new List<int>();
        Console.WriteLine("Введите числа через пробел:");
        string input = Console.ReadLine();
        string[] numberStrings = input.Split(' '); // Разделяем ввод на отдельные строки

        foreach (string numberString in numberStrings)
        {
            if (int.TryParse(numberString, out int num)) // Проверяем, является ли строка числом
            {
                numbers.Add(num);
            }
        }

        // Обработка каждого введенного числа
        foreach (int n in numbers)
        {
            int sum, product;
            CalculateSumAndProduct(n, out sum, out product); // Вызываем функцию для вычисления суммы и произведения
            int difference = Math.Abs(sum - product); // Вычисляем модуль разности

            // Формируем вывод разложения
            string numberStr = n.ToString();
            string sumExpression = string.Join(" + ", numberStr.Select(c => c - '0'));
            string productExpression = string.Join(" * ", numberStr.Select(c => c - '0'));
            Console.WriteLine($"{sum} {product} {difference} ({sumExpression} = {sum}; {productExpression} = {product}; |{sum} - {product}| = {difference})");
        }
    }
}
