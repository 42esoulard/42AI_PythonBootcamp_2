import time
from random import randint
import os
from timeit import default_timer as timer


def log(func):

    def func_wrapper(*args):

        start_time = timer()
        result = func(*args)
        elapsed = timer() - start_time
        sec = 'ms'
        if elapsed < 0.001:
            elapsed *= 1000
        else:
            sec = 's'

        function_name = func.__name__.replace('_', ' ').capitalize()
        line = f'(esoulard)Running: {function_name.ljust(16)}' + \
            f'[ exec-time = {elapsed:.3f} {sec} ]\n'
        with open('machine.log', 'a+') as logfile:
            logfile.write(line)
        return result

    return func_wrapper


class CoffeeMachine():
    water_level = 100

    @log
    def start_machine(self):
        if self.water_level > 20:
            return True
        else:
            print("Please add water!")
            return False

    @log
    def boil_water(self):
        return "boiling..."

    @log
    def make_coffee(self):
        if self.start_machine():
            for _ in range(20):
                time.sleep(0.1)
                self.water_level -= 1
            print(self.boil_water())
            print("Coffee is ready!")

    @log
    def add_water(self, water_level):
        time.sleep(randint(1, 5))
        self.water_level += water_level
        print("Blub blub blub...")


if __name__ == "__main__":
    machine = CoffeeMachine()
    for i in range(0, 5):
        machine.make_coffee()
    machine.make_coffee()
    machine.add_water(70)
