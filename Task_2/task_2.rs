use std::collections::HashSet;
use std::io;

fn is_pangram() -> bool {
    println!("Введите строку:");
    let mut sentence = String::new();
    io::stdin()
        .read_line(&mut sentence)
        .expect("Ошибка при чтении строки");

    let sentence = sentence.trim();
    let mut letters = HashSet::new();

    for c in sentence.chars() {
        let lower_c = c.to_lowercase().next().unwrap_or(c);
        if lower_c >= 'a' && lower_c <= 'z' {
             letters.insert(lower_c);
        }
    }
    letters.len() == 26
}

fn main() {
    if is_pangram() {
        println!("true");
    } else {
        println!("false");
    }
}
