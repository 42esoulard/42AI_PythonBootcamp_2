from vector import Vector 
import sys

hello = "hello"

if len(sys.argv) == 3:
    try:
        print(f'Value: {(eval(sys.argv[1]) * eval(sys.argv[2])).values }')
        print(f'Shape: {(eval(sys.argv[1]) * eval(sys.argv[2])).shape}')

    except ValueError as e:
        print(f'ValueError: {e}')
