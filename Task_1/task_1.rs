use std::io;
use std::io::Write;

fn get_river_crossing_result() -> i32 {
    print!("Введите общее количество валунов (stones): ");
    io::stdout().flush().unwrap(); // Очищаем буфер вывода
    let mut stones_input = String::new();
    io::stdin().read_line(&mut stones_input).unwrap(); // Читаем ввод
    let stones: i32 = stones_input.trim().parse().unwrap(); // Преобразуем строку в число

    print!("Введите количество птиц (N): ");
    io::stdout().flush().unwrap();
    let mut n_input = String::new();
    io::stdin().read_line(&mut n_input).unwrap();
    let n: i32 = n_input.trim().parse().unwrap();  // Читаем количество птиц и преобразуем в число

    let mut birds = Vec::new();
    print!("Введите дальность полета для каждой из {} птиц через пробел: ", n);
    io::stdout().flush().unwrap();
    let mut birds_input = String::new();
    io::stdin().read_line(&mut birds_input).unwrap();
    let bird_distances: Vec<i32> = birds_input
        .trim()
        .split(" ")
        .map(|s| s.parse().unwrap()) // Читаем дальности полета, разделяем строку, преобразуем в числа
        .collect();
    for distance in bird_distances {
        birds.push(distance); // Заполняем вектор
    }

    let mut visited_stones = vec![false; stones as usize]; // Создаем вектор для отслеживания посещенных валунов.
                                                         // Изначально все значения false

    // Моделируем перелеты птиц
    for &range in &birds {
        let mut i = range - 1;
        while i < stones {
            visited_stones[i as usize] = true; // Помечаем валун как посещенный
            i += range;
        }
    }

    let unvisited_count = visited_stones.iter().filter(|&&visited| !visited).count() as i32; // Считаем непосещенные
    unvisited_count
}

fn main() {
    let result = get_river_crossing_result(); // Вызываем функцию
    println!("Количество валунов, на которых не появится ни одной птицы: {}", result); // Выводим результат
}
