import numpy as np
import copy

class ColorFilter:

    def __init__(self):
        pass

    @staticmethod
    def invert(array):
        """
        Inverts the color of the image received as a numpy array.
        Args:
            array: numpy.ndarray corresponding to the image.
        Return:
            array: numpy.ndarray corresponding to the transformed image.
            None: otherwise.
        Raises:
            This function should not raise any Exception.
        Authorized functions: none
        Authorized operator: + -
        """

        try:
            if not isinstance(array, np.ndarray):
                return None
            for row in range(len(array)):
                for pix in range(len(array[row])):
                    for i in range(len(array[row][pix])):
                        array[row][pix][i] = 1. - array[row][pix][i]
            return array
        except Exception as e:
            print(e)
            return None

    @staticmethod
    def to_blue(array):
        """
        Applies a blue filter to the image received as a numpy array.
        Args:
            array: numpy.ndarray corresponding to the image.
        Return:
            array: numpy.ndarray corresponding to the transformed image.
            None: otherwise.
        Raises:
            This function should not raise any Exception.
        Authorized functions: .zeros,.shape,.dstack
        Authorized operator: None
        """

        try:
            if not isinstance(array, np.ndarray):
                return None
            r = np.zeros(array[:,:,0].shape)
            g = np.zeros(array[:,:,1].shape)
            b = array[:,:,2]
            return np.dstack((r, g, b))
            
        except Exception as e:
            print(e)
            return None

    @staticmethod
    def to_green(array):
        """
        Applies a green filter to the image received as a numpy array.
        Args:
            array: numpy.ndarray corresponding to the image.
        Return:
            array: numpy.ndarray corresponding to the transformed image.
            None: otherwise.
        Raises:
            This function should not raise any Exception.
        Authorized functions: copy.deepcopy
        Authorized operator: *
        """ 

        try:
            if not isinstance(array, np.ndarray):
                return None
            return copy.deepcopy(array) * [0,1,0]
            
        except Exception as e:
            print(e)
            return None

    @staticmethod
    def to_red(array):
        """
        Applies a red filter to the image received as a numpy array.
        Args:
            array: numpy.ndarray corresponding to the image.
        Return:
            array: numpy.ndarray corresponding to the transformed image.
            None: otherwise.
        Raises:
            This function should not raise any Exception.
        Authorized functions: .to_green, .to_blue
        Authorized operator: + -
        """

        try:
            if not isinstance(array, np.ndarray):
                return None
            return array - ColorFilter.to_blue(array) - ColorFilter.to_green(array)
            
        except Exception as e:
            print(e)
            return None

    @staticmethod
    def to_celluloid(array):
        """
        Applies a celluloid filter to the image received as a numpy array.
        Celluloid filter must display at least four thresholds of shades.
        Be careful! You are not asked to apply black contour on the object,
        you only have to work on the shades of your images.
        Remarks:
            celluloid filter is also known as cel-shading or toon-shading.
        Args:
            array: numpy.ndarray corresponding to the image.
        Return:
            array: numpy.ndarray corresponding to the transformed image.
            None: otherwise.
        Raises:
        This function should not raise any Exception.
        Authorized functions: .arange, .linspace
        """

        try:
            if not isinstance(array, np.ndarray):
                return None
            steps = np.arange(0, 1, .24)
            for i in range(len(steps) - 2, -1, -1):
                match = ((steps[i] <= array) & (array < steps[i + 1]))
                array[match] = steps[i]
            return array

        except Exception as e:
            print(e)
            return None

    @staticmethod
    def to_grayscale(array, filter, **kwargs):
        """
        Applies a grayscale filter to the image received as a numpy array.
        For filter = 'mean'/'m': performs the mean of RBG channels.
        For filter = 'weight'/'w': performs a weighted mean of RBG channels.
        Args:
            array: numpy.ndarray corresponding to the image.
            filter: string with accepted values in ['m','mean','w','weight']
            weights: [kwargs] list of 3 floats where the sum equals to 1,
                corresponding to the weights of each RBG channels.
        Return:
            array: numpy.ndarray corresponding to the transformed image.
            None: otherwise.
        Raises:
            This function should not raise any Exception.
        Authorized functions: .sum,.shape,.tile,.reshape,.dstack,.broadcast_to,.as_type
        Authorized operator: * /
        """

        try:
            if (not isinstance(array, np.ndarray) or 
                filter not in ['m', 'mean', 'w', 'weight'] or
                (filter in ['w', 'weight'] and 
                 ("weights" not in kwargs or 
                  not isinstance(kwargs["weights"], list) or 
                  not all(isinstance(n, float)
                          for n in kwargs["weights"]) or
                  not np.sum(kwargs["weights"]) == 1))):
                return None
            if filter in ['m', 'mean']:
                sm = np.sum(array, 2)
                reshaped = np.reshape(sm, (array.shape[0], array.shape[1], 1))
                brd = np.broadcast_to(reshaped, (array.shape[0], array.shape[1], 3))
                ret = brd[:,:,:] / array.shape[2]
            else:
                array[:,:,:] *= kwargs["weights"]
                sm = np.sum(array, 2)
                ret = np.tile(sm[:,:,None], (1, 1, 3))
            return ret

        except Exception as e:
            print(e)
            return None
    
from ImageProcessor import ImageProcessor

imp = ImageProcessor()
arr = imp.load("../resources/elon_canaGAN.png")
imp.display(arr)

cf = ColorFilter()
# inverted = cf.invert(arr)
# imp.display(inverted)

# arr = imp.load("../resources/elon_canaGAN.png")
# blue = cf.to_blue(arr)
# imp.display(blue)

# arr = imp.load("../resources/elon_canaGAN.png")
# green = cf.to_green(arr)
# imp.display(green)

# arr = imp.load("../resources/elon_canaGAN.png")
# red = cf.to_red(arr)
# imp.display(red)

# arr = imp.load("../resources/elon_canaGAN.png")
# celluloid = cf.to_celluloid(arr)
# imp.display(celluloid)

arr = imp.load("../resources/elon_canaGAN.png")
gray = cf.to_grayscale(arr, 'm')
imp.display(gray)

arr = imp.load("../resources/elon_canaGAN.png")
gray = cf.to_grayscale(arr, 'weighted', weights=[0.2, 0.3, 0.5])
imp.display(gray)

arr = imp.load("../resources/elon_canaGAN.png")
gray = cf.to_grayscale(arr, 'weight', weights=[0.2, 0.3, 0.5])
imp.display(gray)