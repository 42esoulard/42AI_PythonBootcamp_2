import numpy as np

class ScrapBooker:

    def __init__(self):
        pass

    def crop(self, array, dim, position=(0,0)):
        """
        Crops the image as a rectangle via dim arguments (being the new height
        and width of the image) from the coordinates given by position arguments.
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
        Deletes every n-th line pixels along the specified axis (0: vertical, 1: horizontal)
        Args:
        array: numpy.ndarray.
        n: non null positive integer lower than the number of row/column of the array
        (depending of axis value).
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
                not axis in [0, 1]):
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
                not axis in [0, 1]):
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
        Makes a grid with multiple copies of the array. The dim argument specifies
        the number of repetition along each dimensions.
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


# spb = ScrapBooker()

# arr1 = np.arange(0,25).reshape(5,5)
# print(arr1)
# print(spb.crop(arr1, (3,1),(1,0)))

# not_numpy_arr = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
# print(spb.crop(not_numpy_arr, (1,2)))

# print(spb.crop(arr1, (1,2,3)))

# print('---------')

# arr2 = np.array("A B C D E F G H I".split() * 6).reshape(-1,9)
# print(arr2)
# print(spb.thin(arr2,3,0))

# arr3 = np.array([[var] * 10 for var in "ABCDEFG"])
# print(spb.thin(arr3,3,1))
# print(arr3)
# print(spb.thin(not_numpy_arr,3,1))
# print(spb.thin(arr3,15,1))
# print(spb.thin(arr3,-1,1))
# print(spb.thin(arr3, 1,2))

# print('---------')

# arr4 = np.array([[1, 2, 3],[1, 2, 3],[1, 2, 3]])
# print(arr4)
# print(spb.juxtapose(arr4, 3, 1))

# arr5 = np.array([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
# print(arr5)
# print(spb.juxtapose(arr5, 2, 0))
# print(spb.juxtapose(arr5, 2, 2))
# print(spb.juxtapose(arr5, -1, 0))
# print(spb.juxtapose(not_numpy_arr, 2, 0))

# print('---------')

# print(spb.mosaic(arr4, (3, 1)))
# print(spb.mosaic(arr5, (2, 2)))
# print(spb.mosaic(arr5, (2, 0)))
# print(spb.mosaic(arr5, (0, 2)))
# print(spb.mosaic(not_numpy_arr, (2, 2)))

