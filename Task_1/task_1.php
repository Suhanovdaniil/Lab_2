<?php
function getRiverCrossingResult() {
    echo "Введите общее количество валунов (stones): ";
    $stones = intval(readline()); // Читаем количество валунов

    echo "Введите количество птиц (N): ";
    $n = intval(readline());     // Читаем количество птиц

    echo "Введите дальность полета для каждой из $n птиц через пробел: ";
    $birdDistances = explode(" ", readline()); // Читаем дальности полета и разбиваем строку в массив
    $birds = array_map('intval', $birdDistances); // Преобразуем строковые значения в числа

    $visitedStones = array_fill(0, $stones, false); // Создаем массив для отслеживания посещенных валунов.
                                                    // Изначально все значения false
    // Моделируем перелеты птиц
    foreach ($birds as $range) {
        for ($i = $range - 1; $i < $stones; $i += $range) {
            $visitedStones[$i] = true; // Помечаем валун как посещенный
        }
    }

    $unvisitedCount = 0;
    foreach ($visitedStones as $visited) {
        if (!$visited) {         // Если валун не посещен
            $unvisitedCount++; // Увеличиваем счетчик
        }
    }

    return $unvisitedCount; // Возвращаем количество непосещенных валунов
}

$result = getRiverCrossingResult(); // Вызываем функцию
echo "Количество валунов, на которых не появится ни одной птицы: " . $result . PHP_EOL; // Выводим результат
?>
