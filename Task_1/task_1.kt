fun getRiverCrossingResult(): Int {
    print("Введите общее количество валунов (stones): ")
    val stones = readln().toInt() // Читаем количество валунов

    print("Введите количество птиц (N): ")
    val n = readln().toInt()     // Читаем количество птиц

    val birds = IntArray(n) // Создаем массив для хранения дальности полета птиц
    print("Введите дальность полета для каждой из $n птиц через пробел: ")
    val birdDistances = readln().split(" ").map { it.toInt() } // Читаем дальности полета и преобразуем в массив чисел
    for (i in 0..<n) {
        birds[i] = birdDistances[i] // Заполняем массив birds
    }

    val visitedStones = BooleanArray(stones) // Создаем массив для отслеживания посещенных валунов.
                                             // Изначально все значения false
    // Моделируем перелеты птиц
    for (range in birds) {
        for (i in range - 1..<stones step range) {
            visitedStones[i] = true // Помечаем валун как посещенный
        }
    }

    var unvisitedCount = 0
    for (visited in visitedStones) {
        if (!visited) {       // Если валун не посещен
            unvisitedCount++ // Увеличиваем счетчик
        }
    }

    return unvisitedCount // Возвращаем количество непосещенных валунов
}

fun main() {
    val result = getRiverCrossingResult() // Вызываем функцию
    println("Количество валунов, на которых не появится ни одной птицы: $result") // Выводим результат
}
