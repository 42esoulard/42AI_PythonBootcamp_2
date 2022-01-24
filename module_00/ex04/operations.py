import sys


def print_usage():
    print('Usage: python operations.py <number1> <number2>\n'
          'Example:\n'
          '    python operations.py 10 3')


def print_result(tot, diff, prod, quot, rem):
    print(f'{"Sum:":11} {tot}\n'
          f'{"Difference:":11} {diff}\n'
          f'{"Product:":11} {prod}\n'
          f'{"Quotient:":11} {quot}\n'
          f'{"Remainder:":11} {rem}')


def operations(number1, number2):
    tot = number1 + number2
    diff = number1 - number2
    prod = number1 * number2
    if number2 != 0:
        quot = number1 / number2
        rem = number1 % number2
    else:
        quot = 'ERROR (div by zero)'
        rem = 'ERROR (modulo by zero)'
    print_result(tot, diff, prod, quot, rem)


if len(sys.argv) < 3:
    print_usage()
elif len(sys.argv) > 3:
    print('InputError: too many arguments\n')
    print_usage()
else:
    try:
        operations(int(sys.argv[1]), int(sys.argv[2]))
    except ValueError:
        print('InputError: only numbers\n')
        print_usage()
