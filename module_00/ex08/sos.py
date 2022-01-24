import sys


morse = {'A': '.-',
         'B': '-...',
         'C': '-.-.',
         'D': '-..',
         'E': '.',
         'F': '..-.',
         'G': '--.',
         'H': '....',
         'I': '..',
         'J': '.---',
         'K': '-.-',
         'L': '.-..',
         'M': '--',
         'N': '-.',
         'O': '---',
         'P': '.--.',
         'Q': '--.-',
         'R': '.-.',
         'S': '...',
         'T': '-',
         'U': '..-',
         'V': '...-',
         'W': '.--',
         'X': '-..-',
         'Y': '-.--',
         'Z': '--..',
         '0': '-----',
         '1': '.----',
         '2': '..---',
         '3': '...--',
         '4': '....-',
         '5': '.....',
         '6': '-....',
         '7': '--...',
         '8': '---..',
         '9': '----.'}


def to_morse(char):
    if char in morse:
        return morse[char]


if len(sys.argv) > 1:
    user_input = ' '.join(sys.argv[1:])

    if not user_input.replace(" ", "").isalnum():
        print('ERROR')
    else:
        user_input = user_input.upper()
        result = ''
        for word in user_input.split():
            for letter in list(word):
                result += to_morse(letter) + ' '
            result += '/ '
        if result[-3:] == ' / ':
            result = result[:-3]

        print(result)
