class Vector:

    def __init__(self, base):
        if isinstance(base, list):
            if all(isinstance(n, float) for n in base):
                self.values = base
                self.shape = (1, len(base))
            elif all(isinstance(n, list) for n in base) and \
                all(len(n) == 1 for n in base) and \
                    all(isinstance(n[0], float) for n in base):
                self.values = base
                self.shape = (len(base), 1)
            else:
                raise ValueError("Bad vector initialization values")
        elif isinstance(base, int):
            if base <= 0:
                raise ValueError("Bad vector initialization values")
            self.values = []
            for n in range(base):
                self.values.append([float(n)])
            self.shape = (len(self.values), 1)
        elif isinstance(base, tuple) and len(base) == 2:
            if not all(isinstance(n, int) for n in base):
                raise ValueError("Bad vector initialization values")
            self.values = []
            for n in range(base[0], base[1]):
                self.values.append([float(n)])
            self.shape = (len(self.values), 1)
        else:
            raise ValueError("Bad vector initialization values")

    def __add__(self, other):
        if not isinstance(other, Vector) or other.shape != self.shape:
            raise ValueError("Cannot add vectors of different dimensions")
        result = []
        for n in range(len(self.values)):
            if isinstance(self.values[n], float):
                result.append(self.values[n] + other.values[n])
            else:
                result.append([self.values[n][0] + other.values[n][0]])
        return Vector(result)
        # print('Vector(' + str(Vector(result)) + ')')

    def __radd__(self, other):
        return self.__add__(other)

    def __sub__(self, other):
        if not isinstance(other, Vector) or other.shape != self.shape:
            raise ValueError("Cannot substract vectors of "
                             "different dimensions")
        result = []
        for n in range(len(self.values)):
            if isinstance(self.values[n], float):
                result.append(self.values[n] - other.values[n])
            else:
                result.append([self.values[n][0] - other.values[n][0]])
        return Vector(result)
        # print('Vector(' + str(Vector(result)) + ')')

    def __rsub__(self, other):
        return self.__sub__(other)

    def __truediv__(self, other):
        try:
            if not other or (not isinstance(other, str) and
                             not isinstance(other, int) and
                             not isinstance(other, float)):
                raise ValueError()
            float(other)
        except ValueError:
            raise ValueError("Can only divide a Vector by a non-zero scalar")
        result = []
        for n in range(len(self.values)):
            if isinstance(self.values[n], float):
                result.append(self.values[n] / other)
            else:
                result.append([self.values[n][0] / other])
        return Vector(result)
        # print('Vector(' + str(Vector(result)) + ')')

    def __rtruediv__(self, other):
        raise ValueError("A scalar cannot be divided by a Vector")

    def __mul__(self, other):
        try:
            if (not other and other != 0) or (not isinstance(other, str) and
                                              not isinstance(other, int) and
                                              not isinstance(other, float)):
                raise ValueError()
            float(other)
        except ValueError:
            raise ValueError("Can only multiply a Vector by a scalar")
        result = []
        for n in range(len(self.values)):
            if isinstance(self.values[n], float):
                result.append(self.values[n] * other)
            else:
                result.append([self.values[n][0] * other])
        return Vector(result)
        # print('Vector(' + str(Vector(result)) + ')')

    def __rmul__(self, other):
        return self.__mul__(other)

    def __str__(self):
        return "Values : " + str(self.values) \
               + "\nShape : " + str(self.shape)

    def __repr__(self):
        return 'Vector(' + str(self.values) + ')'

    def dot(self, other):
        if not isinstance(other, Vector) or other.shape != self.shape:
            raise ValueError("Cannot calculate dot product of vectors"
                             " of different dimensions")
        ret = 0
        for n in range(len(self.values)):
            if isinstance(self.values[n], float):
                ret += self.values[n] * other.values[n]
            else:
                ret += self.values[n][0] * other.values[n][0]
        return ret

    def T(self):
        res = []
        if self.shape[0] == 1:
            for n in range(len(self.values)):
                res.append([self.values[n]])
        else:
            for n in range(len(self.values)):
                res.append(self.values[n][0])
        return Vector(res)
