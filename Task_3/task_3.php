<?php
// Функция для вычисления суммы и произведения цифр числа
function calculateSumAndProduct($n) {
    $sum = 0;
    $product = 1;
    $number = (string)$n; // Преобразуем число в строку

    foreach (str_split($number) as $digitChar) {
        $digit = (int)$digitChar; // Преобразуем символ цифры в число
        $sum += $digit;
        $product *= $digit;
    }
    return array($sum, $product);
}

// Получаем ввод из STDIN
echo "Введите числа через пробел: ";
$input = trim(fgets(STDIN));
$numberStrings = explode(" ", $input); // Разбиваем строку на массив чисел

// Фильтруем массив, оставляя только целые числа
$numbers = array_filter(
    $numberStrings,
    function ($value) {
        return is_numeric($value) && (int)$value == $value; // Проверяем, является ли значение целым числом
    }
);
$numbers = array_map('intval', $numbers); // Преобразуем строки в целые числа


// Обрабатываем каждое введенное число
foreach ($numbers as $n) {
    list($sum, $product) = calculateSumAndProduct($n); // Получаем сумму и произведение
    $difference = abs($sum - $product); // Вычисляем модуль разности

    // Формируем вывод разложения
    $numberStr = (string)$n;
    $sumExpression = implode(" + ", str_split($numberStr));
    $productExpression = implode(" * ", str_split($numberStr));

    echo "$sum $product $difference ($sumExpression = $sum; $productExpression = $product; |$sum - $product| = $difference)\n";
}
?>
