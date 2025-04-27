use std::io;

fn process_number_detailed(n_str: &str) -> Option<(String, String, i32)> {
    let digits: Vec<i32> = n_str.chars()
        .map(|c| c.to_digit(10).map(|d| d as i32))
        .collect::<Option<Vec<i32>>>()?;

    let sum: i32 = digits.iter().sum();
    let product: i32 = digits.iter().product();
    let difference_abs = (sum - product).abs();

    // Формируем строки для вывода операций сложения и умножения.
    let sum_calculation = digits.iter()
        .map(|d| d.to_string())
        .collect::<Vec<String>>()
        .join("+");

    let product_calculation = digits.iter()
        .map(|d| d.to_string())
        .collect::<Vec<String>>()
        .join("*");

    Some((
        format!("{}={}", sum_calculation, sum),
        format!("{}={}", product_calculation, product),
        difference_abs,
    ))
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    let numbers: Vec<&str> = input.trim().split_whitespace().collect();

    for number_str in numbers {
        match process_number_detailed(number_str) {
            Some((sum_str, product_str, difference)) => {
                println!("{} {} {} ({}; {}; |{}-{}|={})",
                         sum_str.split("=").last().unwrap_or(""),
                         product_str.split("=").last().unwrap_or(""),
                         difference,
                         sum_str,
                         product_str,
                         sum_str.split("=").last().unwrap_or(""),
                         product_str.split("=").last().unwrap_or(""),
                         difference);
            }
            None => {
                eprintln!("Ошибка: Некорректный ввод для числа '{}'", number_str);
            }
        }
    }
}
