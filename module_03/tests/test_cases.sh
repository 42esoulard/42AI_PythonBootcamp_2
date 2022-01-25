ex00() {
    cp $EXO_PATH/ex00/NumPyCreator.py tests/ex00/NumPyCreator.py

    test "python tests/ex00/ex00_test.py \"npc.from_list([[1,2,3],[6,3,4]])\"" \
          "[[1 2 3]
 [6 3 4]]" \
          $'    [ npc.from_list([[1,2,3],[6,3,4]]) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_list([[1,2,3],[6,4]])\"" \
          "None" \
          $'    [ npc.from_list([[1,2,3],[6,4]]) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_list('HEHE')\"" \
        "None" \
        $'    [ npc.from_list("HEHE") ]'

    test "python tests/ex00/ex00_test.py \"npc.from_list([[1,2,3],['a','b','c'],[6,4,7]])\"" \
        "[['1' '2' '3']
 ['a' 'b' 'c']
 ['6' '4' '7']]" \
        $'    [ npc.from_list([[1,2,3],[\'a\',\'b\',\'c\'],[6,4,7]]) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_list(((1,2),(3,4)))\"" \
        "None" \
        $'    [ npc.from_list(((1,2),(3,4))) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_tuple(('a','b','c'))\"" \
        "['a' 'b' 'c']" \
        $'    [ npc.from_tuple(("a","b","c")) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_tuple([[1,2,3],[6,3,4]])\"" \
        "None" \
        $'    [ npc.from_tuple([[1,2,3],[6,3,4]]) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_tuple(-1)\"" \
        "None" \
        $'    [ npc.from_tuple(-1) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_tuple(((1,2,3),(1,2,3,4)))\"" \
        "None" \
        $'    [ npc.from_tuple(((1,2,3),(1,2,3,4))) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_iterable(range(5))\"" \
    "['0' '1' '2' '3' '4']" \
    $'    [ npc.from_iterable(range(5)) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_iterable(1)\"" \
    "None" \
    $'    [ npc.from_iterable(1) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_shape((3,5))\"" \
    "[[0 0 0 0 0]
 [0 0 0 0 0]
 [0 0 0 0 0]]" \
    $'    [ npc.from_shape((3,5)) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_shape((-2, 2))\"" \
    "None" \
    $'    [ npc.from_shape((-2, 2)) ]'

    test "python tests/ex00/ex00_test.py \"npc.from_shape((2, 'HEHE'))\"" \
    "None" \
    $'    [ npc.from_shape((2, "HEHE")) ]'

    supervise "python tests/ex00/ex00_test.py \"npc.random((3,5))\"" \
        $'Please confirm that random numpy array has the proper shape (3,5)'  

    test "python tests/ex00/ex00_test.py \"npc.random((-2, 2))\"" \
        "None" \
        $'    [ npc.random((-2, 2)) ]'

    test "python tests/ex00/ex00_test.py \"npc.random((2, 'HEHE'))\"" \
        "None" \
        $'    [ npc.random((2, "HEHE")) ]'

    test "python tests/ex00/ex00_test.py \"npc.identity(4)\"" \
        "[[1. 0. 0. 0.]
 [0. 1. 0. 0.]
 [0. 0. 1. 0.]
 [0. 0. 0. 1.]]" \
        $'    [ npc.identity(4) ]'


    test "python tests/ex00/ex00_test.py \"npc.identity('HEHE')\"" \
        "None" \
        $'    [ npc.identity("HEHE") ]'

    test "python tests/ex00/ex00_test.py \"npc.identity(-15)\"" \
        "None" \
        $'    [ npc.identity(-15) ]'

}

ex01() {
    pip install matplotlib
    cp $EXO_PATH/ex01/ImageProcessor.py tests/ex01/ImageProcessor.py

    test "python tests/ex01/ex01_test.py \"non_existing_file.png\"" \
    "Exception: [Errno 2] No such file or directory: 'non_existing_file.png'
None
Exception: Input should be a numpy array" \
    $'    [ arr = imp.load(\"non_existing_file.png\") ]\n    [ print(arr) ]\n    [ imp.display(arr) ]'

    test "python tests/ex01/ex01_test.py \"./resources/empty_file.png\"" \
    "Exception: not a PNG file
None
Exception: Input should be a numpy array" \
    $'    [ arr = imp.load(\"./resources/empty_file.png\") ]\n    [ print(arr) ]\n    [ imp.display(arr) ]'

        test "python tests/ex01/ex01_test.py \"./resources/42AI.png\"" \
    "Loading image of dimensions 200 x 200
[[[0.03529412 0.12156863 0.3137255 ]
  [0.03921569 0.1254902  0.31764707]
  [0.04313726 0.12941177 0.3254902 ]
  ...
  [0.02745098 0.07450981 0.22745098]
  [0.02745098 0.07450981 0.22745098]
  [0.02352941 0.07058824 0.22352941]]

 [[0.03921569 0.11764706 0.30588236]
  [0.03529412 0.11764706 0.30980393]
  [0.03921569 0.12156863 0.30980393]
  ...
  [0.02352941 0.07450981 0.22745098]
  [0.02352941 0.07450981 0.22745098]
  [0.02352941 0.07450981 0.22745098]]

 [[0.03137255 0.10980392 0.2901961 ]
  [0.03137255 0.11372549 0.29803923]
  [0.03529412 0.11764706 0.30588236]
  ...
  [0.02745098 0.07450981 0.23137255]
  [0.02352941 0.07450981 0.22745098]
  [0.02352941 0.07450981 0.22745098]]

 ...

 [[0.03137255 0.07450981 0.21960784]
  [0.03137255 0.07058824 0.21568628]
  [0.03137255 0.07058824 0.21960784]
  ...
  [0.03921569 0.10980392 0.2784314 ]
  [0.03921569 0.10980392 0.27450982]
  [0.03921569 0.10980392 0.27450982]]

 [[0.03137255 0.07058824 0.21960784]
  [0.03137255 0.07058824 0.21568628]
  [0.03137255 0.07058824 0.21568628]
  ...
  [0.03921569 0.10588235 0.27058825]
  [0.03921569 0.10588235 0.27058825]
  [0.03921569 0.10588235 0.27058825]]

 [[0.03137255 0.07058824 0.21960784]
  [0.03137255 0.07058824 0.21176471]
  [0.03137255 0.07058824 0.21568628]
  ...
  [0.03921569 0.10588235 0.26666668]
  [0.03921569 0.10588235 0.26666668]
  [0.03921569 0.10588235 0.26666668]]]" \
    $'    [ arr = imp.load(\"./resources/42AI.png\") ]\n    [ print(arr) ]\n    [ imp.display(arr) ]'

    supervise "" \
    $'Please confirm that the 42AI.png image is properly displayed'  

}
