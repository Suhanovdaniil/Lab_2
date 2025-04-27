using System;
using System.Linq;
public class RiverCrossing
{
    // Функция для ввода данных и вычислений
    static int GetRiverCrossingResult()
    {
        Console.WriteLine("Введите общее количество валунов (stones):");
        int stones = int.Parse(Console.ReadLine());
        Console.WriteLine("Введите количество птиц (N):");
        int n = int.Parse(Console.ReadLine());
        int[] birds = new int[n];
        Console.WriteLine($"Введите дальность полета для каждой из {n} птиц через пробел:");
        string[] birdDistances = Console.ReadLine().Split(' ');
        for (int i = 0; i < n; i++)
        {
            birds[i] = int.Parse(birdDistances[i]);
        }
        // Создаем массив, чтобы отслеживать посещенные валуны
        bool[] visitedStones = new bool[stones];
        // Моделируем перелет каждой птицы
        foreach (int range in birds)
        {
            for (int i = range - 1; i < stones; i += range)
            {
                visitedStones[i] = true;
            }
        }
        // Подсчитываем количество непосещенных валунов
        int unvisitedCount = 0;
        for (int i = 0; i < stones; i++)
        {
            if (!visitedStones[i])
            {
                unvisitedCount++;
            }
        }
        return unvisitedCount;
    }
    public static void Main(string[] args)
    {
        // Получаем результат вычислений
        int result = GetRiverCrossingResult();
        // Выводим результат
        Console.WriteLine($"Количество валунов, на которых не появится ни одной птицы: {result}");
    }
}
