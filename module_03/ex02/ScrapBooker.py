import numpy as np


class ScrapBooker:

    def __init__(self):
        pass

    def crop(self, array, dim, position=(0, 0)):
        """
        Crops the image as a rectangle via dim arguments (being the new
        height and width of the image) from the coordinates given by
        position arguments.
        Args:
        array: numpy.ndarray
        dim: tuple of 2 integers.
        position: tuple of 2 integers.
        Returns:
        new_arr: the cropped numpy.ndarray.
        None otherwise (combinaison of parameters not compatible).
        Raises:
        This function should not raise any Exception.
        """

        try:
            if (not isinstance(array, np.ndarray) or
                not isinstance(dim, tuple) or
                not isinstance(position, tuple) or
                not len(dim) == 2 or not len(position) == 2 or
                not all(isinstance(n, int) for n in dim) or
                    not all(isinstance(n, int) for n in position)):
                return None

            size = array.shape
            if (dim[0] > (size[0] - position[0]) or
                    dim[1] > (size[1] - position[1])):
                return None

            return (array[position[0]:position[0] + dim[0],
                          position[1]:position[1] + dim[1]])

        except Exception as e:
            return None

    def thin(self, array, n, axis):
        """
        Deletes every n-th line pixels along the specified axis
        (0: vertical, 1: horizontal)
        Args:
        array: numpy.ndarray.
        n: non null positive integer lower than the number of
        row/column of the array (depending of axis value).
        axis: positive non null integer.
        Returns:
        new_arr: thined numpy.ndarray.
        None otherwise (combinaison of parameters not compatible).
        Raises:
        This function should not raise any Exception.
        """

        try:
            if (not isinstance(array, np.ndarray) or
                not isinstance(n, int) or
                not isinstance(axis, int) or
                    axis not in [0, 1]):
                return None

            axis = 0 if axis == 1 else 1
            if not 0 < n < array.shape[axis]:
                return None

            to_delete = [i for i in range(array.shape[axis])
                         if not (i + 1) % 3]
            return np.delete(array, to_delete, axis)

        except Exception as e:
            return None

    def juxtapose(self, array, n, axis):
        """
        Juxtaposes n copies of the image along the specified axis.
        Args:
        array: numpy.ndarray.
        n: positive non null integer.
        axis: integer of value 0 or 1.
        Returns:
        new_arr: juxtaposed numpy.ndarray.
        None otherwise (combinaison of parameters not incompatible).
        Raises:
        This function should not raise any Exception.
        """

        try:
            if (not isinstance(array, np.ndarray) or
                not isinstance(n, int) or
                not isinstance(axis, int) or
                not 0 < n or
                    axis not in [0, 1]):
                return None

            result = np.asarray(array)
            for i in range(n - 1):
                result = np.concatenate((result, array), axis)
            return result

        except Exception as e:
            print(e)
            return None

    def mosaic(self, array, dim):
        """
        Makes a grid with multiple copies of the array.
        The dim argument specifies the number of repetition
        along each dimensions.
        Args:
        array: numpy.ndarray.
        dim: tuple of 2 integers.
        Returns:
        new_arr: mosaic numpy.ndarray.
        None otherwise (combinaison of parameters not incompatible).
        Raises:
        This function should not raise any Exception.
        """

        try:
            if (not isinstance(array, np.ndarray) or
                not isinstance(dim, tuple) or
                not len(dim) == 2 or
                    not all(isinstance(n, int) for n in dim)):
                return None

            return self.juxtapose(self.juxtapose(array, dim[0], 0), dim[1], 1)

        except Exception as e:
            print(e)
            return None
