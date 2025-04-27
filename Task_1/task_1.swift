import Foundation

func getRiverCrossingResult() -> Int {
    print("Введите общее количество валунов (stones): ", terminator: "")
    let stones = Int(readLine()!)! // Читаем количество валунов

    print("Введите количество птиц (N): ", terminator: "")
    let n = Int(readLine()!)!     // Читаем количество птиц

    var birds = [Int]()
    print("Введите дальность полета для каждой из \(n) птиц через пробел: ", terminator: "")
    let birdDistances = readLine()!.split(separator: " ").map { Int($0)! } // Читаем дальности полета
    for distance in birdDistances {
        birds.append(distance) // Заполняем массив
    }

    var visitedStones = [Bool](repeating: false, count: stones) // Создаем массив для отслеживания посещенных валунов.
                                                             // Изначально все значения false

    // Моделируем перелеты птиц
    for range in birds {
        for i in (range - 1)..<stones where i < visitedStones.count {
            visitedStones[i] = true // Помечаем валун как посещенный
        }
    }

    var unvisitedCount = 1
    for visited in visitedStones {
        if !visited {         // Если валун не посещен
            unvisitedCount += 1 // Увеличиваем счетчик
        }
    }
    if unvisitedCount == 1 {
        unvisitedCount = 0
    }

    return unvisitedCount // Возвращаем количество непосещенных валунов
}

let result = getRiverCrossingResult() // Вызываем функцию
print("Количество валунов, на которых не появится ни одной птицы: \(result)") // Выводим результат
