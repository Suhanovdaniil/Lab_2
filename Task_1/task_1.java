import java.util.Scanner;
import java.util.Arrays;

public class RiverCrossing {

    // Функция для ввода данных и вычислений
    public static int getRiverCrossingResult() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Введите общее количество валунов (stones): ");
        int stones = scanner.nextInt(); // Читаем количество валунов

        System.out.print("Введите количество птиц (N): ");
        int n = scanner.nextInt();    // Читаем количество птиц

        int[] birds = new int[n];
        System.out.print("Введите дальность полета для каждой из " + n + " птиц через пробел: ");
        for (int i = 0; i < n; i++) {
            birds[i] = scanner.nextInt(); // Читаем дальности полета
        }

        boolean[] visitedStones = new boolean[stones]; // Создаем массив для отслеживания посещенных валунов.
                                                    // Изначально все значения false

        // Моделируем перелеты птиц
        for (int range : birds) {
            for (int i = range - 1; i < stones; i += range) {
                visitedStones[i] = true; // Помечаем валун как посещенный
            }
        }

        int unvisitedCount = 0;
        for (boolean visited : visitedStones) {
            if (!visited) {         // Если валун не посещен
                unvisitedCount++; // Увеличиваем счетчик
            }
        }

        scanner.close();
        return unvisitedCount; // Возвращаем количество непосещенных валунов
    }

    public static void main(String[] args) {
        int result = getRiverCrossingResult(); // Вызываем функцию
        System.out.println("Количество валунов, на которых не появится ни одной птицы: " + result); // Выводим результат
    }
}
