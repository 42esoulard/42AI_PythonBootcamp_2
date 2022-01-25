import sys
import numpy as np
from ScrapBooker import ScrapBooker


if len(sys.argv) == 2:
    try:
        spb = ScrapBooker()
        print(eval(sys.argv[1]))
    except Exception as e:
        print(e)