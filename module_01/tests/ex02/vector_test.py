from vector import Vector 
import sys

hello = "hello"

# print(f'[{sys.argv[1]}]')
# print(f'#{eval(sys.argv[1])}#')
if len(sys.argv) == 2:
    try:
        print(f'Value: {eval(sys.argv[1]).values}')
        print(f'Shape: {eval(sys.argv[1]).shape}')

    except ValueError as e:
        print(f'ValueError: {e}')
