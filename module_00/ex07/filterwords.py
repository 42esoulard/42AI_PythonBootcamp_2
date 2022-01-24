import sys
import string


if len(sys.argv) == 3:
    try:
        text = ''.join([char for char in list(sys.argv[1])
                        if char not in string.punctuation])
        mini = int(sys.argv[2])
        print([word for word in text.split() if len(word) > mini])
    except ValueError:
        print('ERROR')
else:
    print('ERROR')
