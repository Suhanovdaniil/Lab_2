<?php

function isPangram() {
    echo "Введите строку: ";
    $sentence = trim(fgets(STDIN));
    $sentence = strtolower($sentence);

    $letters = [];
    for ($i = 0; $i < strlen($sentence); $i++) {
        $char = $sentence[$i];
        if ($char >= 'a' && $char <= 'z') {
            $letters[$char] = true;
        }
    }
    return count($letters) == 26;
}

if (isPangram()) {
    echo "true\n";
} else {
    echo "false\n";
}
?>
