def ft_filter(function_to_apply, iterable):
    """Filter the result of function apply to all elements of the iterable.
    Args:
    function_to_apply: a function taking an iterable.
    iterable: an iterable object (list, tuple, iterator).
    Returns:
    An iterable.
    None if the iterable can not be used by the function.
    """

    try:
        it = iter(iterable)
    except TypeError:
        raise TypeError(f'\'{type(iterable).__name__}\' '
                        'object is not iterable')
    for elem in iterable:
        if not function_to_apply:
            yield elem
        elif function_to_apply(elem):
            yield elem


# x = [1,2,3,4,5]

# print(filter(lambda dum: not (dum % 2), x))
# print(list(filter(lambda dum: not (dum % 2), x)))
# print(ft_filter(lambda dum: not (dum % 2), x))
# print(list(ft_filter(lambda dum: not (dum % 2), x)))

# print(filter(lambda dum: dum + "str", x))
# print(list(filter(lambda dum: dum + "str", x)))
# print(ft_filter(lambda dum: dum + "str", x))
# print(list(ft_filter(lambda dum: dum + "str", x)))

# print(filter("sha", x))
# print(list(filter("sha", x)))
# print(ft_filter("sha", x))
# print(list(ft_filter("sha", x)))

# print(filter(lambda dum: dum + "str", 1))
# print(list(filter(lambda dum: dum + "str", 1)))
# print(ft_filter(lambda dum: dum + "str", 1))
# print(list(ft_filter(lambda dum: dum + "str", 1)))
