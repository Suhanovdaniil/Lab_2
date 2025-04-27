import java.util.Scanner

fun isPangram(scanner: Scanner): Boolean {
    print("Введите строку: ")
    val sentence = scanner.nextLine()

    val letters = mutableSetOf<Char>()
    for (char in sentence) {
        val lowerChar = char.lowercaseChar()
        if (lowerChar in 'a'..'z') {
            letters.add(lowerChar)
        }
    }
    return letters.size == 26
}

fun main() {
    val scanner = Scanner(System.`in`)
    if (isPangram(scanner)) {
        println("true")
    } else {
        println("false")
    }
    scanner.close()
}
