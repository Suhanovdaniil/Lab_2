import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class PangramChecker {
    public static boolean isPangram(Scanner scanner) {
        System.out.print("Введите строку: ");
        String sentence = scanner.nextLine();
        sentence = sentence.toLowerCase();

        Set<Character> letters = new HashSet<>();
        for (char c : sentence.toCharArray()) {
            if (c >= 'a' && c <= 'z')
                letters.add(c);
        }
        return letters.size() == 26;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        if (isPangram(scanner)) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }
        scanner.close();
    }
}
