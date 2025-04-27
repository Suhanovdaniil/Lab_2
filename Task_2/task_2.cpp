#include <iostream>
#include <string>
#include <unordered_set>
#include <cctype>

using namespace std;

bool isPangram() {
    cout << "Введите строку для проверки: ";
    string sentence;
    getline(cin, sentence);

    unordered_set<char> letters;
    for (char c : sentence) {
        char lowerC = tolower(c);
        if (lowerC >= 'a' && lowerC <= 'z') {
            letters.insert(lowerC);
        }
    }
    return letters.size() == 26;
}

int main() {
    if (isPangram()) {
        cout << "true" << endl;
    } else {
        cout << "false" << endl;
    }
    return 0;
}
