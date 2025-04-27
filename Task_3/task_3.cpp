#include <iostream>
#include <cmath>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

// Функция для вычисления суммы и произведения цифр числа
void calculateSumAndProduct(int n, int& sum, int& product) {
    sum = 0;
    product = 1;
    string number = to_string(n); // Преобразуем число в строку для удобства итерации по цифрам

    for (char digitChar : number) {
        int digit = digitChar - '0'; // Преобразуем символ цифры обратно в число
        sum += digit;
        product *= digit;
    }
}

int main() {
    vector<int> numbers;
    int num;

    // Ввод чисел из стандартного ввода
    cout << "Введите числа через пробел (для завершения введите не число): ";
    while (cin >> num) {
        numbers.push_back(num);
    }
    cin.clear(); // Очищаем флаги ошибок ввода, чтобы можно было читать ввод дальше

    // Обработка каждого введенного числа
    for (int n : numbers) {
        int sum, product;
        calculateSumAndProduct(n, sum, product); // Вызываем функцию для вычисления суммы и произведения
        int difference = abs(sum - product); // Вычисляем модуль разности
        cout << sum << " " << product << " " << difference << " (" ;

        // Выводим разложение суммы
        string numberStr = to_string(n);
        for (size_t i = 0; i < numberStr.length(); ++i) {
            cout << (numberStr[i] - '0');
            if (i < numberStr.length() - 1) {
                cout << " + ";
            }
        }
        cout << " = " << sum << "; ";

        // Выводим разложение произведения
        for (size_t i = 0; i < numberStr.length(); ++i) {
            cout << (numberStr[i] - '0');
            if (i < numberStr.length() - 1) {
                cout << " * ";
            }
        }
        cout << " = " << product << "; |" << sum << " - " << product << "| = " << difference << ")" << endl;
    }

    return 0;
}
