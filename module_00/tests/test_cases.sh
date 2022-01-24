ex01() {
  echo -e "${BOLD}Ex0${EX}:${NC}"

  test "python $EXO_PATH/ex01/exec.py 'Hello World!' | cat -e" \
          '!DLROw OLLEh$'

  test "python $EXO_PATH/ex01/exec.py \"Hello\" \"my Friend\" | cat -e" \
          'DNEIRf YM OLLEh$'

  test "python $EXO_PATH/ex01/exec.py" \
          ''
}

ex02() {
  test "python $EXO_PATH/ex02/whois.py 12" \
        "I'm Even."

  test "python $EXO_PATH/ex02/whois.py 3" \
          "I'm Odd."

  test "python $EXO_PATH/ex02/whois.py" \
          ""

  test "python $EXO_PATH/ex02/whois.py 0" \
          "I'm Zero."

  test "python $EXO_PATH/ex02/whois.py Hello" \
          "ERROR"

  test "python $EXO_PATH/ex02/whois.py 12 3" \
          "ERROR"
}


ex03() {
  cp $EXO_PATH/ex03/count.py tests/count.py

  test 'python tests/count_test.py "Python 2.0, released 2000, introduced features like List comprehensions and a garbage collection system capable of collecting reference cycles."' \
          $'The test contains 143 characters:\n- 2 upper letters\n- 113 lower letters\n- 4 punctuation marks\n- 18 spaces'

  test 'python tests/count_test.py "Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python'\''s design philosophy emphasizes code readability with its notable use of significant whitespace."' \
          $'The test contains 234 characters:\n- 5 upper letters\n- 187 lower letters\n- 8 punctuation marks\n- 30 spaces'

  supervise 'python tests/count_test.py' \
          $'Please confirm that the count matches the text your entered'

  test 'python tests/count_test.py "Python", "2.0"' \
          $'ERROR'

  test 'python tests/count_doc.py' \
          $'This function counts the number of upper characters, lower characters,\npunctuation and spaces in a given text.'
}


ex04() {
  test "python $EXO_PATH/ex04/operations.py 10 3" \
            $'Sum:        13\nDifference: 7\nProduct:    30\nQuotient:   3.3333333333333335\nRemainder:  1'

  test "python $EXO_PATH/ex04/operations.py 42 10" \
            $'Sum:        52\nDifference: 32\nProduct:    420\nQuotient:   4.2\nRemainder:  2'

  test "python $EXO_PATH/ex04/operations.py 1 0" \
            $'Sum:        1\nDifference: 1\nProduct:    0\nQuotient:   ERROR (div by zero)\nRemainder:  ERROR (modulo by zero)'

  test "python $EXO_PATH/ex04/operations.py" \
            $'Usage: python operations.py <number1> <number2>\nExample:\n    python operations.py 10 3'

  test "python $EXO_PATH/ex04/operations.py 12 10 5" \
            $'InputError: too many arguments\n\nUsage: python operations.py <number1> <number2>\nExample:\n    python operations.py 10 3'

  test "python $EXO_PATH/ex04/operations.py \"one\" \"two\"" \
            $'InputError: only numbers\n\nUsage: python operations.py <number1> <number2>\nExample:\n    python operations.py 10 3'

  test "python ex04/operations.py \"512\" \"63.1\"" \
            $'InputError: only numbers\n\nUsage: python operations.py <number1> <number2>\nExample:\n    python operations.py 10 3'
}

ex05() {
  test "python $EXO_PATH/ex05/kata00.py" \
            $'The 3 numbers are: 19, 42, 21'

  test "python $EXO_PATH/ex05/kata01.py" \
            $'Python was created by Guido van Rossum\nRuby was created by Yukihiro Matsumoto\nPHP was created by Rasmus Lerdorf'

  test "python $EXO_PATH/ex05/kata02.py" \
            $'09/25/2019 03:30'

  test "python $EXO_PATH/ex05/kata03.py | cat -e && python $EXO_PATH/ex05/kata03.py | wc -c" \
            $'--------------------------The right format42'

  test "python $EXO_PATH/ex05/kata04.py" \
            $'module_00, ex_04 : 132.42, 1.00e+04, 1.23e+04'
}

ex06() {
supervise "python $EXO_PATH/ex06/recipe.py" \
        $'Please confirm that the functionalities of the Cookbook exercise work as expected: \n   - main menu loop\n   - add\n   - delete\n   - print recipe\n   - print book\n   - quit\n'
}

ex07() {
  test "python $EXO_PATH/ex07/filterwords.py \"Hello, my friend\" 3" \
            "['Hello', 'friend']"

  test "python $EXO_PATH/ex07/filterwords.py \"A robot must protect its own existence as long as such protection does not conflict with the First or Second Law\" 6" \
            "['protect', 'existence', 'protection', 'conflict']"

  test "python $EXO_PATH/ex07/filterwords.py Hello World" \
            "ERROR"

  test "python $EXO_PATH/ex07/filterwords.py 300 3" \
            "[]"
}

ex08() {
  test "python $EXO_PATH/ex08/sos.py \"SOS\"" \
            "... --- ..."
  
  test "python $EXO_PATH/ex08/sos.py" \
            ""
  
  test "python $EXO_PATH/ex08/sos.py \"HELLO / WORLD\"" \
            "ERROR"

  test "python $EXO_PATH/ex08/sos.py \"96 BOULEVARD\" \"Bessiere\"" \
            "----. -.... / -... --- ..- .-.. . ...- .- .-. -.. / -... . ... ... .. . .-. ."
}

ex09() {
  supervise "python $EXO_PATH/ex09/guess.py" \
          $'Please confirm that the secret number guessing game works as expected (bad input handling, attempts count, 42 custom answer, \'exit\' command)'
}

ex10() {
  cp $EXO_PATH/ex10/loading.py tests/loading.py

  supervise "python tests/loading_test.py" \
          $'Please confirm that the loader had the behaviour you\'d expect from a nice loading bar'

  supervise "python tests/loading_test1.py" \
          $'Please confirm that the loader had the behaviour you\'d expect from a nice loading bar'
}
