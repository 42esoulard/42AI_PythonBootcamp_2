import sys
import time
from timeit import default_timer as timer


def ft_progress(lst):
    start = timer()
    bar = '=>'
    step = 5

    for n in lst:
        if int(n / len(lst) * 100) >= step:
            bar = '=' + bar
            step += 5
        cur = timer()
        remaining = ((cur - start) / (n + 1)) * (len(lst) - n)
        print(f'ETA: {remaining:.2f}s [{int(n / len(lst) * 100):3d}%]'
              f'[{bar.ljust(21)}] {n}/{len(lst)} | elapsed time '
              f'{cur - start:.2f}s \r', end="")
        yield n

    print(f'ETA: 0.00s [100%][{bar[:-1]}=] {len(lst)}/{len(lst)} | '
          f'elapsed time {cur - start:.2f}s \r', end="")
