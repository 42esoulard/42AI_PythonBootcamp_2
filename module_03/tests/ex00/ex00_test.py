import sys
from NumPyCreator import NumPyCreator


if len(sys.argv) == 2:
    try:
        npc = NumPyCreator()
        print(eval(sys.argv[1]))
    except TypeError as e:
        print(e)
    except ValueError as e:
        print(e)