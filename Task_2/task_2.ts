function isPangram(sentence: string): boolean {
    const letters: Set<string> = new Set<string>();

    for (const char of sentence) {
        const lowerChar = char.toLowerCase();
        if (lowerChar >= 'a' && lowerChar <= 'z') {
            letters.add(lowerChar);
        }
    }

    return letters.size === 26;
}

function main(): void {
    const sentence: string = prompt('Введите строку для проверки на панграмму:') || '';
    if (isPangram(sentence)) {
        console.log('true');
    } else {
        console.log('false');
    }
}

main();
