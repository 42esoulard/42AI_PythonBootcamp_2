from vector import Vector 
import sys

hello = "hello"

if len(sys.argv) == 2:
    try:
        print(f'{eval(sys.argv[1])}')
    except ValueError as e:
        print(f'ValueError: {e}')
