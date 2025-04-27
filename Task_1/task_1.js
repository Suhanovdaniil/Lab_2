function getRiverCrossingResult() {
    const stones = parseInt(prompt("Введите общее количество валунов (stones):")); // Читаем количество валунов
    const n = parseInt(prompt("Введите количество птиц (N):"));    // Читаем количество птиц

    const birds = [];
    const birdDistances = prompt(`Введите дальность полета для каждой из ${n} птиц через пробел:`)?.split(" ") || []; // Читаем дальности полета
    for (let i = 0; i < n; i++) {
        birds[i] = parseInt(birdDistances[i]) || 0; // Заполняем массив
    }

    const visitedStones = new Array(stones).fill(false); // Создаем массив для отслеживания посещенных валунов.
                                                     // Изначально все значения false

    // Моделируем перелеты птиц
    for (const range of birds) {
        for (let i = range - 1; i < stones; i += range) {
            visitedStones[i] = true; // Помечаем валун как посещенный
        }
    }

    let unvisitedCount = 0;
    for (const visited of visitedStones) {
        if (!visited) {          // Если валун не посещен
            unvisitedCount++; // Увеличиваем счетчик
        }
    }

    return unvisitedCount; // Возвращаем количество непосещенных валунов
}

const result = getRiverCrossingResult(); // Вызываем функцию
console.log(`Количество валунов, на которых не появится ни одной птицы: ${result}`); // Выводим результат
