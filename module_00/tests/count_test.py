import sys
from count import text_analyzer 

# print(sys.argv)
if len(sys.argv) == 1:
  text_analyzer()
elif len(sys.argv) == 2: 
  text_analyzer(sys.argv[1])
elif len(sys.argv) == 3: 
  text_analyzer(sys.argv[1], sys.argv[2])
else:
  print('Test case not recognized')
