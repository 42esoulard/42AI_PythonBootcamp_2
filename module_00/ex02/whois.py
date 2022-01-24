import sys


def whois(num):
    if num == 0:
        return 'I\'m Zero.'
    if num % 2 == 0:
        return 'I\'m Even.'
    return 'I\'m Odd.'


if len(sys.argv) == 2:
    try:
        print(whois(int(sys.argv[1])))
    except ValueError:
        print('ERROR')
elif len(sys.argv) != 1:
    print('ERROR')
