using System;
using System.Collections.Generic;
using System.Linq;

public class PangramChecker
{
    public static bool IsPangram()
    {
        Console.Write("Введите строку: ");
        string sentence = Console.ReadLine();

        HashSet<char> letters = new HashSet<char>();
        foreach (char c in sentence)
        {
            char lowerC = Char.ToLower(c);
            if (lowerC >= 'a' && lowerC <= 'z')
                letters.Add(lowerC);
        }
        return letters.Count == 26;
    }

    public static void Main(string[] args)
    {
        if (IsPangram())
        {
            Console.WriteLine("true");
        }
        else
        {
            Console.WriteLine("false");
        }
    }
}
