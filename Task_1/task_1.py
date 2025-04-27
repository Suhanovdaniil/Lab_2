def get_river_crossing_result():
    stones = int(input("Введите общее количество валунов (stones): ")) # Читаем количество валунов
    n = int(input("Введите количество птиц (N): "))    # Читаем количество птиц
    birds = list(map(int, input(f"Введите дальность полета для каждой из {n} птиц через пробел: ").split())) # Читаем дальности полета

    visited_stones = [False] * stones  # Создаем список для отслеживания посещенных валунов.
                                      # Изначально все значения False

    # Моделируем перелеты птиц
    for range_val in birds:
        for i in range(range_val - 1, stones, range_val):
            visited_stones[i] = True # Помечаем валун как посещенный

    unvisited_count = visited_stones.count(False) # Считаем непосещенные валуны
    return unvisited_count # Возвращаем количество непосещенных валунов

if __name__ == "__main__":
    result = get_river_crossing_result() # Вызываем функцию
    print(f"Количество валунов, на которых не появится ни одной птицы: {result}") # Выводим результат
