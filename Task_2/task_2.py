def is_pangram():
    sentence = input("Введите строку: ")
    sentence = sentence.lower()
    letters = set()
    for char in sentence:
        if 'a' <= char <= 'z':
            letters.add(char)
    return len(letters) == 26

if __name__ == "__main__":
    if is_pangram():
        print("true")
    else:
        print("false")
