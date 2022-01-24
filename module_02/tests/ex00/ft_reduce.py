def ft_reduce(function_to_apply, iterable):
    """Apply function of two arguments cumulatively.
    Args:
    function_to_apply: a function taking an iterable.
    iterable: an iterable object (list, tuple, iterator).
    Returns:
    A value, of same type of elements in the iterable parameter.
    None if the iterable can not be used by the function.
    """
    try:
        it = iter(iterable)
    except TypeError:
        raise TypeError(f'reduce() arg 2 must support iteration')
    result = 0
    for elem in iterable:
        try:
            if not result:
                result = elem
            else:
                result = function_to_apply(result, elem)
        except TypeError as e:
            raise TypeError(e)
    return result

# import functools

# lst = ['H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
# print(functools.reduce(lambda u, v: u + v, lst))
# print(ft_reduce(lambda u, v: u + v, lst))
# x = [1,2,3,4,5]
# print(functools.reduce(lambda u, v: u + v, x))
# print(ft_reduce(lambda u, v: u + v, x))
# x = [[1],[2],[3],[4],[5]]
# print(functools.reduce(lambda u, v: u + v, x))
# print(ft_reduce(lambda u, v: u + v, x))

# print(functools.reduce(lambda dum: dum + "str", x))
# print(ft_reduce(lambda dum: dum + "str", x))


# print(functools.reduce(lambda dum, i: dum + "str", x))
# print(ft_reduce(lambda dum, i: dum + "str", x))

# print(functools.reduce("sha", x))
# print(ft_reduce("sha", x))

# print(functools.reduce(lambda dum: dum + "str", 1))
# print(ft_reduce(lambda dum: dum + "str", 1))
