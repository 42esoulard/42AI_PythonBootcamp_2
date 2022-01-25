import sys
from ImageProcessor import ImageProcessor


if len(sys.argv) == 2:
    try:
        imp = ImageProcessor()
        arr = imp.load(sys.argv[1])
        print(arr)
        imp.display(arr)
    except Exception as e:
        print(e)
