import kotlin.math.abs

// Функция для вычисления суммы и произведения цифр числа
fun calculateSumAndProduct(n: Int): Pair<Int, Int> {
    var sum = 0
    var product = 1
    val number = n.toString() // Преобразуем число в строку

    for (digitChar in number) {
        val digit = digitChar.toString().toInt() // Преобразуем символ цифры в число
        sum += digit
        product *= digit
    }
    return Pair(sum, product)
}

fun main() {
    // Ввод чисел из стандартного ввода
    print("Введите числа через пробел: ")
    val input = readlnOrNull() ?: "" // Считываем строку из ввода
    val numbers = input.split(" ").mapNotNull { it.toIntOrNull() }  // Разделяем строку по пробелам и преобразуем в числа

    // Обработка каждого введенного числа
    for (n in numbers) {
        val (sum, product) = calculateSumAndProduct(n) // Получаем сумму и произведение
        val difference = abs(sum - product) // Вычисляем модуль разности

        // Формируем строку для вывода разложения числа
        val numberStr = n.toString()
        val sumExpression = numberStr.map { it.toString().toInt() }.joinToString(" + ")
        val productExpression = numberStr.map { it.toString().toInt() }.joinToString(" * ")

        println("$sum $product $difference ($sumExpression = $sum; $productExpression = $product; |$sum - $product| = $difference)")
    }
}
