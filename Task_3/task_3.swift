import Foundation

// Функция для вычисления суммы и произведения цифр числа
func calculateSumAndProduct(n: Int) -> (sum: Int, product: Int) {
    var sum = 0
    var product = 1
    let numberString = String(n) // Преобразуем число в строку

    for digitChar in numberString {
        if let digit = digitChar.wholeNumberValue { // Преобразуем символ цифры в число
            sum += digit
            product *= digit
        }
    }
    return (sum, product)
}

// Функция для чтения ввода из консоли
func readInput() -> String? {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let inputString = String(data: inputData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
    return inputString
}

// Основная функция
func main() {
    print("Введите числа через пробел:")
    if let input = readInput() {
        let numberStrings = input.components(separatedBy: " ") // Разбиваем строку на массив подстрок
        let numbers = numberStrings.compactMap { Int($0) } // Преобразуем строки в массив чисел

        // Обрабатываем каждое введенное число
        for n in numbers {
            let (sum, product) = calculateSumAndProduct(n) // Получаем сумму и произведение
            let difference = abs(sum - product) // Вычисляем модуль разности

            // Формируем вывод разложения
            let numberStr = String(n)
            let sumExpression = numberStr.compactMap { $0.wholeNumberValue }.map { String($0) }.joined(separator: " + ")
            let productExpression = numberStr.compactMap { $0.wholeNumberValue }.map { String($0) }.joined(separator: " * ")

            print("\(sum) \(product) \(difference) (\(sumExpression) = \(sum); \(productExpression) = \(product); |\(sum) - \(product)| = \(difference))")
        }
    }
}

main()
