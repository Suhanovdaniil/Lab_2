#include <iostream>
#include <vector>

using namespace std;

// Функция для ввода данных и вычислений
int getRiverCrossingResult() {
    int stones, n;

    cout << "Введите общее количество валунов (stones): ";
    cin >> stones; // Читаем количество валунов с консоли

    cout << "Введите количество птиц (N): ";
    cin >> n;     // Читаем количество птиц с консоли

    vector<int> birds(n); // Создаем вектор для хранения дальности полета птиц
    cout << "Введите дальность полета для каждой из " << n << " птиц через пробел: ";
    for (int i = 0; i < n; ++i) {
        cin >> birds[i]; // Читаем дальность полета каждой птицы
    }

    vector<bool> visitedStones(stones, false); // Создаем вектор для отслеживания посещенных валунов.
                                             // Изначально все значения false (валун не посещен)

    // Моделируем перелеты каждой птицы
    for (int range : birds) {
        for (int i = range - 1; i < stones; i += range) {
            visitedStones[i] = true; // Помечаем валун как посещенный
        }
    }

    int unvisitedCount = 0;
    for (bool visited : visitedStones) {
        if (!visited) {        // Если валун не был посещен
            unvisitedCount++; // увеличиваем счетчик
        }
    }

    return unvisitedCount; // Возвращаем количество непосещенных валунов
}

int main() {
    int result = getRiverCrossingResult(); // Вызываем функцию для получения результата
    cout << "Количество валунов, на которых не появится ни одной птицы: " << result << endl; // Выводим результат
    return 0;
}
