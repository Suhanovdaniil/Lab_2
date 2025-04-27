import Foundation

func isPangram() -> Bool {
    print("Введите строку: ", terminator: "")
    guard let sentence = readLine() else {
        return false
    }
    let lowerSentence = sentence.lowercased()
    var letters = Set<Character>()
    for char in lowerSentence {
        if char >= "a" && char <= "z" {
            letters.insert(char)
        }
    }
    return letters.count == 26
}

if isPangram() {
    print("true")
} else {
    print("false")
}
