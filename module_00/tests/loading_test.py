import time
from loading import ft_progress

print('Test: listy = range(1000)')
listy = range(1000)
ret = 0
for elem in ft_progress(listy):
  ret += (elem + 3) % 5
  time.sleep(0.01)
print()
print(ret)
