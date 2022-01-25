from matplotlib import image, pyplot
import numpy as np


class ImageProcessor:

    def __init__(self):
        pass

    @staticmethod
    def load(path):
        """opens the .png file specified by the path
argument and returns an array with the RGB values of the
image pixels It must display a message specifying
the dimensions of the image (e.g. 340 x 500"""
        try:
            array = image.imread(path)
            print(f'Loading image of dimensions '
                  f'{array.shape[0]} x {array.shape[1]}')
            return array
        except Exception as e:
            print(f'Exception: {e}')
            return None

    @staticmethod
    def display(array):
        """takes a numpy array as an argument and displays the corre-
sponding RGB image"""
        try:
            if not isinstance(array, np.ndarray):
                raise TypeError("Input should be a numpy array")
            pyplot.imshow(array)
            pyplot.show()
        except Exception as e:
            print(f'Exception: {e}')
            return None
