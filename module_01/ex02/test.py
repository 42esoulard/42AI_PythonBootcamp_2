from vector import Vector


v1 = Vector([0.0, 1.0, 2.0, 3.0])
v2 = Vector([0.0, 2.0, 3.0, 4.0])
v3 = Vector([[0.0], [1.0], [2.0], [3.0]])
v4 = Vector([[0.0], [1.0], [2.0], [3.0]])
v5 = Vector(4)
v6 = Vector([[1.0], [1.0], [1.0], [1.0]])
v7 = Vector([0.0, 0.0, 0.0, 0.0])


def init():
    print("\n --- VECTOR INITIALIZATION --- ")

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) --- ")
    print(f'val: {Vector([0.0, 1.0, 2.0, 3.0]).values}')
    print(f'shape: {Vector([0.0, 1.0, 2.0, 3.0]).shape}')

    print("\n --- Vector([[1. , 2e-3, 3.14, 5.]) --- ")
    print(f'val: {Vector([1. , 2e-3, 3.14, 5.]).values}')
    print(f'shape: {Vector([1. , 2e-3, 3.14, 5.]).shape}')

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) --- ")
    print(f'val: {Vector([[0.0], [1.0], [2.0], [3.0]]).values}')
    print(f'shape: {Vector([[0.0], [1.0], [2.0], [3.0]]).shape}')

    print("\n --- Vector(4) --- ")
    print(f'val: {Vector(4).values}')
    print(f'shape: {Vector(4).shape}')

    print("\n --- Vector((10, 12)) --- ")
    print(f'val: {Vector((10, 12)).values}')
    print(f'shape: {Vector((10, 12)).shape}')

    print("\n --- Vector((4, 7.1)) --- ")
    try:
        Vector((4, 7.1))
    except ValueError as e:
        print(f'ValueError: {e}')

    print("\n --- Vector(-1) --- ")
    try:
        print(Vector(-1))
    except ValueError as e:
        print(f'ValueError: {e}')

# --------------------------------------------------


def add():
    print("\n --- VECTOR ADDITION --- ")

    print("\n --- Vector(4) + Vector([[1.0], [1.0], [1.0], [1.0]])--- ")
    print((v5 + v6).values)

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) + "
          "Vector([0.0, 2.0, 3.0, 4.0])--- ")
    print((v1 + v2).values)

    print("\n --- Vector([0.0, 2.0, 3.0, 4.0]) + "
          "Vector([0.0, 1.0, 2.0, 3.0]) --- ")
    print((v2 + v1).values)

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) + "
          "Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    print((v3 + v4).values)

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) + "
          "Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    try:
        print((v1 + v3).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) + 2--- ")
    try:
        print((v1 + 2).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- 2 + Vector([0.0, 1.0, 2.0, 3.0])--- ")
    try:
        print((2 + v1).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) + Vector([0.0, 0.0, 0.0, 0.0])--- ")
    try:
        print((v5 + v7).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) + \"hello\" --- ")
    try:
        print((v5 + "hello").values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) + None --- ")
    try:
        print((v5 + None).values)
    except ValueError as e:
        print(f'Error: {e}')

# --------------------------------------------------


def sub():
    print("\n --- VECTOR SUBSTRACTION --- ")

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) - "
          "Vector([0.0, 2.0, 3.0, 4.0])--- ")
    print((v1 - v2).values)

    print("\n --- Vector([0.0, 2.0, 3.0, 4.0]) - "
          "Vector([0.0, 1.0, 2.0, 3.0]) --- ")
    print((v2 - v1).values)

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) "
          "- Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    print((v3 - v4).values)

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) - "
          "Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    try:
        print((v1 - v3).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) - 2 --- ")
    try:
        print((v1 - 2).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- 2 - Vector([0.0, 1.0, 2.0, 3.0]) --- ")
    try:
        print((2 - v1).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) - \"hello\" --- ")
    try:
        print((v5 - "hello").values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) - None --- ")
    try:
        print((v5 - None).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- None - Vector(4) --- ")
    try:
        print((None - v5).values)
    except ValueError as e:
        print(f'Error: {e}')

# --------------------------------------------------


def div():
    print("\n --- VECTOR DIVISION --- ")

    print("\n --- Vector(4) / 2 --- ")
    print((v5 / 2).values)

    print("\n --- Vector(4) / 3.14 --- ")
    print((v5 / 3.14).values)

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) / 2 --- ")
    print((v1 / 2).values)

    print("\n --- Vector(4) / 0 --- ")
    try:
        print((v5 / 0).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) / None --- ")
    try:
        print((v5 / None).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) / \"Hi\" --- ")
    try:
        print((v5 / "Hi").values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- None / Vector(4) --- ")
    try:
        print((None / v5).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- 3 / Vector(4) --- ")
    try:
        print((3 / v5).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]])"
          " / Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    try:
        print((v3 / v4).values)
    except ValueError as e:
        print(f'Error: {e}')

# --------------------------------------------------


def mul():
    print("\n --- VECTOR MULTIPLICATION --- ")

    print("\n --- Vector(4) * 2 --- ")
    print((v5 * 2).values)

    print("\n --- 2 * Vector(4) --- ")
    # print((2 * v5).values)
    print((2 * v5))

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) * 2) --- ")
    print((v1 * 2).values)

    print("\n --- 2.0 * Vector(4) --- ")
    print((2.0 * v5).values)

    print("\n --- Vector(4) * 0 --- ")
    try:
        print((v5 * 0).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) * None --- ")
    try:
        print((v5 * None).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- None * Vector(4) --- ")
    try:
        print((None * v5).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]])"
          " * Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    try:
        print((v3 * v4).values)
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector(4) * \"Hi\" --- ")
    try:
        print((v5 * "Hi").values)
    except ValueError as e:
        print(f'Error: {e}')

# --------------------------------------------------


def out():
    print("\n --- VECTOR FORMATTING --- ")

    print("\n --- str(Vector(4)) --- ")
    print(str(v1))

    print("\n --- repr(Vector(4)) --- ")
    print(repr(v1))

# --------------------------------------------------


def dot():
    print("\n --- VECTOR DOT PRODUCT --- ")

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) ⋅"
          " Vector([0.0, 2.0, 3.0, 4.0])--- ")
    print(v1.dot(v2))

    print("\n --- Vector([0.0, 2.0, 3.0, 4.0]) ⋅"
          " Vector([0.0, 1.0, 2.0, 3.0])--- ")
    print(v2.dot(v1))

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]])"
          " ⋅ Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    print(v3.dot(v4))

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]])"
          " ⋅ Vector([[0.0], [1.0], [2.0], [3.0]])--- ")
    print(v4.dot(v3))

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) "
          "⋅ Vector([0.0, 1.0, 2.0, 3.0])--- ")
    try:
        print(v4.dot(v1))
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ 3)--- ")
    try:
        print(v4.dot(3))
    except ValueError as e:
        print(f'Error: {e}')

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ \"Hi\")--- ")
    try:
        print(v4.dot("Hi"))
    except ValueError as e:
        print(f'Error: {e}')

# --------------------------------------------------


def trans():
    print("\n --- VECTOR TRANSPOSE --- ")

    print("\n --- Vector([0.0, 1.0, 2.0, 3.0]) --- ")
    print(f'Before shape: {Vector([0.0, 1.0, 2.0, 3.0]).shape}')
    print(f'After shape: {v1.T().shape}')

    print("\n --- Vector([[0.0], [1.0], [2.0], [3.0]]) --- ")
    print(f'Before shape: {Vector([[0.0], [1.0], [2.0], [3.0]]).shape}')
    print(f'After shape: {v3.T().shape}')


init()
add()
sub()
div()
mul()
out()
dot()
trans()
