package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// Функция для ввода данных и вычислений
func getRiverCrossingResult() int {
	var stones, n int

	fmt.Print("Введите общее количество валунов (stones): ")
	fmt.Scanln(&stones)

	fmt.Print("Введите количество птиц (N): ")
	fmt.Scanln(&n)

	birds := make([]int, n)
	fmt.Printf("Введите дальность полета для каждой из %d птиц через пробел: ", n)

	reader := bufio.NewReader(os.Stdin)
	birdDistancesStr, _ := reader.ReadString('\n')
	birdDistances := strings.Split(strings.TrimSpace(birdDistancesStr), " ")

	for i := 0; i < n; i++ {
		if i < len(birdDistances) {
			num, err := strconv.Atoi(birdDistances[i])
			if err == nil {
				birds[i] = num
			} else {
				birds[i] = 0
			}
		} else {
			birds[i] = 0
		}
	}

	visitedStones := make([]bool, stones) // false означает, что валун не посещен

	for _, rangeVal := range birds {
		for i := rangeVal - 1; i < stones; i += rangeVal {
			visitedStones[i] = true
		}
	}

	unvisitedCount := 0
	for _, visited := range visitedStones {
		if !visited {
			unvisitedCount++
		}
	}

	return unvisitedCount
}

func main() {
	result := getRiverCrossingResult()
	fmt.Println("Количество валунов, на которых не появится ни одной птицы:", result)
}
