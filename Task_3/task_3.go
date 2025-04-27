package main


import (
   "bufio"
   "fmt"
   "os"
   "strconv"
   "strings"
)


// Функция для вычисления суммы и произведения цифр числа.
func calculateSumAndProduct(n int) (int, int) {
   sum := 0
   product := 1
   num := n // Создаем копию n


   for num > 0 {
       digit := num % 10
       sum += digit
       product *= digit
       num /= 10
   }
   return sum, product
}


func main() {
   // Используем Scanner для чтения из стандартного ввода.
   scanner := bufio.NewScanner(os.Stdin)


   // Бесконечный цикл для чтения строк из стандартного ввода.
   for {
       // Читаем строку из стандартного ввода.
       if !scanner.Scan() {
           break // Завершаем цикл, если произошла ошибка чтения или достигнут конец ввода.
       }
       input := scanner.Text()


       // Обрезаем пробельные символы в начале и конце строки.
       input = strings.TrimSpace(input)


       // Проверяем, является ли строка пустой.
       if input == "" {
           break // Завершаем цикл, если введена пустая строка.
       }


       // Разделяем строку на подстроки, разделенные пробелами.
       numbersStr := strings.Split(input, " ")


       // Итерируемся по подстрокам.
       for _, numberStr := range numbersStr {
           // Преобразуем подстроку в целое число.
           number, err := strconv.Atoi(numberStr)
           if err != nil {
               // Обрабатываем ошибку преобразования.
               fmt.Fprintf(os.Stderr, "Ошибка: '%s' не является допустимым числом: %v\n", numberStr, err)
               continue // Переходим к следующей итерации цикла.
           }


           // Вызываем функцию для вычисления суммы и произведения.
           sum, product := calculateSumAndProduct(number)
           // Вычисляем абсолютное значение разности.
           difference := abs(sum - product)
           // Выводим результаты.
           fmt.Printf("%d %d %d (%d + %d + %d = %d; %d * %d * %d = %d; |%d - %d| = %d)\n",
               sum, product, difference,
               number%10, (number/10)%10, number/100, sum,
               number%10, (number/10)%10, number/100, product,
               sum, product, difference) //added difference in last %d
       }
   }


   // Проверяем, не возникла ли ошибка при сканировании.
   if err := scanner.Err(); err != nil {
       fmt.Fprintln(os.Stderr, "ошибка при чтении из стандартного ввода:", err)
   }
}


// Функция для вычисления абсолютного значения целого числа.
func abs(x int) int {
   if x < 0 {
       return -x
   }
   return x
}
