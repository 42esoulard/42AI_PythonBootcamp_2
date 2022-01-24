import sys
from ft_map import ft_map
from ft_reduce import ft_reduce
from ft_filter import ft_filter
import functools

if len(sys.argv) == 2:
    try:
        print(eval(sys.argv[1]))
    except TypeError as e:
        print(e)
    except ValueError as e:
        print(e)