// Функция для вычисления суммы и произведения цифр числа
function calculateSumAndProduct(n: number): { sum: number; product: number } {
    let sum = 0;
    let product = 1;
    const numberString = n.toString(); // Преобразуем число в строку

    for (const digitChar of numberString) {
        const digit = parseInt(digitChar, 10); // Преобразуем символ цифры в число
        sum += digit;
        product *= digit;
    }
    return { sum, product };
}

// Функция для получения ввода от пользователя
function getNumbers(): number[] {
    const input = prompt('Введите числа через пробел:');
    if (!input) {
        return [];
    }
    return input.split(' ').map(Number).filter(n => !isNaN(n));
}

// Функция для вывода результатов
function printResults(numbers: number[]) {
    for (const n of numbers) {
        const { sum, product } = calculateSumAndProduct(n); // Получаем сумму и произведение
        const difference = Math.abs(sum - product); // Вычисляем модуль разности

        // Формируем вывод разложения
        const numberStr = n.toString();
        const sumExpression = numberStr.split('').map(Number).join(' + ');
        const productExpression = numberStr.split('').map(Number).join(' * ');

        console.log(`${sum} ${product} ${difference} (${sumExpression} = ${sum}; ${productExpression} = ${product}; |${sum} - ${product}| = ${difference})`);
    }
}

function main() {
    const numbers = getNumbers();
    printResults(numbers);
}

main();
