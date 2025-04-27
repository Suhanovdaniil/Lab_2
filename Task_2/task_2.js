const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout,
});

function isPangram(callback) {
    readline.question('Введите строку: ', (sentence) => {
        const letters = new Set();
        const lowerSentence = sentence.toLowerCase();
        for (const char of lowerSentence) {
            if (char >= 'a' && char <= 'z')
                letters.add(char);
        }
        callback(letters.size === 26);
        readline.close();
    });
}

isPangram((result) => {
    if (result) {
        console.log('true');
    } else {
        console.log('false');
    }
});
