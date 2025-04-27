package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"unicode"
)

func isPangram() bool {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Введите строку: ")
	sentence, _ := reader.ReadString('\n')
	sentence = strings.TrimSpace(sentence)
    sentence = strings.ToLower(sentence)

	letters := make(map[rune]bool)
	for _, char := range sentence {
        lowerChar := unicode.ToLower(char)
		if lowerChar >= 'a' && lowerChar <= 'z' {
			letters[lowerChar] = true;
		}
	}
	return len(letters) == 26
}

func main() {
	if isPangram() {
		fmt.Println("true")
	} else {
		fmt.Println("false")
	}
}
