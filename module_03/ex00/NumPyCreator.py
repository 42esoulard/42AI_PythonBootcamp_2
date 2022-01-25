import numpy as np


class NumPyCreator:

    def __init__(self):
        pass

    @staticmethod
    def from_list(lst):
        """ Takes a list or nested list and returns its corresponding Numpy
array"""
        if not type(lst).__name__ == 'list' or \
            (type(lst[0]).__name__ == 'list' and
                not all(len(n) == len(lst[0]) for n in lst)):
            return None
        return np.array(lst)

    @staticmethod
    def from_tuple(tpl):
        """takes a tuple or nested tuple and returns its corresponding
Numpy array"""
        if not type(tpl).__name__ == 'tuple' or \
           (type(tpl[0]).__name__ == 'tuple' and
                not all(len(n) == len(tpl[0]) for n in tpl)):
            return None
        return np.asarray(tpl)

    @staticmethod
    def from_iterable(itr):
        """takes an iterable and returns an array which contains all of
its elements"""
        try:
            it = iter(itr)
        except TypeError:
            return None
        return np.fromiter(itr, '<U21')

    @staticmethod
    def from_shape(shape, value=0):
        """returns an array filled with the same value, The first
argument is a tuple which specifies the shape of the array, and the second
argument specifies the value of all the elements. This value must be 0 by
default,"""
        if (not type(shape).__name__ == 'tuple' or
            not len(shape) == 2 or
            not all(type(n).__name__ == 'int' and n > 0
                    for n in shape) or
           (not type(value).__name__ == 'int' and
                not type(value).__name__ == 'float')):
            return None
        return np.full(shape, value)

    @staticmethod
    def random(shape):
        """returns an array filled with random values, It takes as an argument
a tuple which specifies the shape of the array"""
        if (not type(shape).__name__ == 'tuple' or
            not len(shape) == 2 or
            not all(type(n).__name__ == 'int' and n > 0
                    for n in shape)):
            return None
        return np.random.randn(shape[0], shape[1])

    @staticmethod
    def identity(n):
        """returns an array representing the identity matrix of size n."""
        if (not type(n).__name__ == 'int'
           or n < 0):
            return None
        return np.identity(n)
