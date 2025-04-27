import java.util.Scanner;
import java.util.InputMismatchException;


public class Main {


   // Функция для вычисления суммы и произведения цифр числа.
   public static int[] calculateSumAndProduct(int n) {
       int sum = 0;
       int product = 1;
       int num = n; // Создаем копию n


       while (num > 0) {
           int digit = num % 10;
           sum += digit;
           product *= digit;
           num /= 10;
       }
       return new int[]{sum, product};
   }


   public static void main(String[] args) {
       Scanner scanner = new Scanner(System.in);


       // Бесконечный цикл для чтения чисел из стандартного ввода.
       while (true) {
           String input = scanner.nextLine();


           // Проверяем, является ли строка пустой.
           if (input.trim().isEmpty()) {
               break; // Завершаем цикл, если введена пустая строка.
           }


           // Разделяем строку на подстроки, разделенные пробелами.
           String[] numbersStr = input.split(" ");


           // Обрабатываем каждую подстроку.
           for (String numberStr : numbersStr) {
               try {
                   // Преобразуем подстроку в целое число.
                   int number = Integer.parseInt(numberStr);


                   // Вызываем функцию для вычисления суммы и произведения.
                   int[] result = calculateSumAndProduct(number);
                   int sum = result[0];
                   int product = result[1];
                   // Вычисляем абсолютное значение разности.
                   int difference = Math.abs(sum - product);
                   // Выводим результаты.
                   System.out.printf("%d %d %d (%d + %d + %d = %d; %d * %d * %d = %d; |%d - %d| = %d)%n",
                           sum, product, difference,
                           number % 10, (number / 10) % 10, number / 100, sum,
                           number % 10, (number / 10) % 10, number / 100, product,
                           sum, product, difference);
               } catch (NumberFormatException e) {
                   // Обрабатываем ошибку преобразования строки в число.
                   System.err.println("Ошибка: '" + numberStr + "' не является допустимым числом: " + e.getMessage());
               }
           }
       }
       scanner.close();
   }
}
