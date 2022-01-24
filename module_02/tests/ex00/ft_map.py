def ft_map(function_to_apply, iterable):
    """Map the function to all elements of the iterable.
    Args:
    function_to_apply: a function taking an iterable.
    iterable: an iterable object (list, tuple, iterator).
    Returns:
    An iterable.
    None if the iterable can not be used by the function."""

    try:
        it = iter(iterable)
    except TypeError:
        raise TypeError(f'\'{type(iterable).__name__}\' '
                        'object is not iterable')
    for elem in iterable:
        yield function_to_apply(elem)

# x = [1,2,3,4,5]
# print(map(lambda dum: dum + 1, x))
# print(list(map(lambda dum: dum + 1, x)))
# print(ft_map(lambda dum: dum + 1, x))
# print(list(ft_map(lambda dum: dum + 1, x)))

# print(map(lambda dum: dum + "str", x))
# print(list(map(lambda dum: dum + "str", x)))
# print(ft_map(lambda dum: dum + "str", x))
# print(list(ft_map(lambda dum: dum + "hello", x)))

# print(map("sha", x))
# print(list(map("sha", x)))
# print(ft_map("sha", x))
# print(list(ft_map("sha", x)))

# print(map(lambda dum: dum + "str", 1))
# print(list(map(lambda dum: dum + "str", 1)))
# print(ft_map(lambda dum: dum + "str", 1))
# print(list(ft_map(lambda dum: dum + "str", 1)))
