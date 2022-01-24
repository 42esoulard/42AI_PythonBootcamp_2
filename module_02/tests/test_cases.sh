ex00() {
    cp $EXO_PATH/ex00/ft_map.py tests/ex00/ft_map.py
    cp $EXO_PATH/ex00/ft_filter.py tests/ex00/ft_filter.py
    cp $EXO_PATH/ex00/ft_reduce.py tests/ex00/ft_reduce.py

    supervise "python tests/ex00/ex00_test.py \"ft_map(lambda dum: dum + 1, [1,2,3,4,5])\"" \
        $'Please confirm that the object type returned by ft_map is \"generator object\"'  

    test "python tests/ex00/ex00_test.py \"list(ft_map(lambda dum: dum + 1, [1,2,3,4,5]))\"" \
          "$(eval python tests/ex00/ex00_test.py \"list\(map\(lambda dum: dum + 1, [1,2,3,4,5]\)\)\")" \
          $'    [ list(ft_map(lambda dum: dum + 1, [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_map(lambda dum: dum + 1, []))\"" \
          "$(eval python tests/ex00/ex00_test.py \"list\(map\(lambda dum: dum + 1, []\)\)\")" \
          $'    [ list(ft_map(lambda dum: dum + 1, [])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_map(lambda dum: dum + 'hello', [1,2,3,4,5]))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(map\(lambda dum: dum + \'hello\', [1,2,3,4,5]\)\)\")" \
        $'    [ list(ft_map(lambda dum: dum + "hello", [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_map('sha', [1,2,3,4,5]))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(map\(\'sha\', [1,2,3,4,5]\)\)\")" \
        $'    [ list(ft_map(  \'sha\', [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_map(lambda dum: dum + 1, 1))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(map\(lambda dum: dum + 1, 1\)\)\")" \
        $'    [ list(ft_map(lambda dum: dum + 1, 1)) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_map(None, [1,2,3,4,5]))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(map\(None, [1,2,3,4,5]\)\)\")" \
        $'    [ list(ft_map(None, [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_map(lambda dum: dum + 1, None))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(map\(lambda dum: dum + 1, None\)\)\")" \
        $'    [ list(ft_map(None, [1,2,3,4,5])) ]'

    supervise "python tests/ex00/ex00_test.py \"ft_filter(lambda dum: not (dum % 2), [1,2,3,4,5])\"" \
        $'Please confirm that the object type returned by ft_filter is \"generator object\"'  

    test "python tests/ex00/ex00_test.py \"list(ft_filter(lambda dum: not (dum % 2), [1,2,3,4,5]))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(filter\(lambda dum: not \(dum % 2\), [1,2,3,4,5]\)\)\")" \
        $'    [ list(ft_filter(lambda dum: not (dum % 2), [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_filter(lambda dum: not (dum % 2), []))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(filter\(lambda dum: not \(dum % 2\), []\)\)\")" \
        $'    [ list(ft_filter(lambda dum: not (dum % 2), [])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_filter(lambda dum: dum + 'hello', [1,2,3,4,5]))\"" \
    "$(eval python tests/ex00/ex00_test.py \"list\(filter\(lambda dum: dum + \'hello\', [1,2,3,4,5]\)\)\")" \
    $'    [ list(ft_filter(lambda dum: dum + "hello", [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_filter('sha', [1,2,3,4,5]))\"" \
    "$(eval python tests/ex00/ex00_test.py \"list\(filter\(\'sha\', [1,2,3,4,5]\)\)\")" \
    $'    [ list(ft_filter(  \'sha\', [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_filter(lambda dum: not (dum % 2), 1))\"" \
    "$(eval python tests/ex00/ex00_test.py \"list\(filter\(lambda dum: not \(dum % 2\), 1\)\)\")" \
    $'    [ list(ft_filter(lambda dum: not (dum % 2), 1)) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_filter(None, [1,2,3,4,5]))\"" \
    "$(eval python tests/ex00/ex00_test.py \"list\(filter\(None, [1,2,3,4,5]\)\)\")" \
    $'    [ list(ft_filter(None, [1,2,3,4,5])) ]'

    test "python tests/ex00/ex00_test.py \"list(ft_filter(lambda dum: dum + 1, None))\"" \
        "$(eval python tests/ex00/ex00_test.py \"list\(filter\(lambda dum: dum + 1, None\)\)\")" \
        $'    [ list(ft_filter(lambda dum: dum + 1, None)) ]'


    test "python tests/ex00/ex00_test.py \"ft_reduce(lambda u, v: u + v, ['H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'])\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(lambda u, v: u + v, [\'H\', \'e\', \'l\', \'l\', \'o\', \' \', \'w\', \'o\', \'r\', \'l\', \'d\']\)\")" \
        $'    [ list(ft_reduce(lambda u, v: u + v, [\'H\', \'e\', \'l\', \'l\', \'o\', \' \', \'w\', \'o\', \'r\', \'l\', \'d\'])) ]'

    test "python tests/ex00/ex00_test.py \"ft_reduce(lambda u, v: u + v, [[1],[2],[3],[4],[5]])\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(lambda u, v: u + v, [[1],[2],[3],[4],[5]]\)\")" \
        $'    [ list(ft_reduce(lambda u, v: u + v, [[1],[2],[3],[4],[5]])) ]'

    test "python tests/ex00/ex00_test.py \"ft_reduce(lambda u: u + 'hello', [[1],[2],[3],[4],[5]])\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(lambda u: u + \'hello\', [[1],[2],[3],[4],[5]]\)\")" \
        $'    [ list(ft_reduce(lambda u: u + \'hello\', [[1],[2],[3],[4],[5]])) ]'


    test "python tests/ex00/ex00_test.py \"ft_reduce(lambda u, v: u + 'hello', [[1],[2],[3],[4],[5]])\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(lambda u, v: u + \'hello\', [[1],[2],[3],[4],[5]]\)\")" \
        $'    [ list(ft_reduce(lambda u, v: u + \'hello\', [[1],[2],[3],[4],[5]])) ]'

    test "python tests/ex00/ex00_test.py \"ft_reduce('hello', [[1],[2],[3],[4],[5]])\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(\'hello\', [[1],[2],[3],[4],[5]]\)\")" \
        $'    [ list(ft_reduce(lambda u, v: u + \'hello\', [[1],[2],[3],[4],[5]])) ]'

    test "python tests/ex00/ex00_test.py \"ft_reduce(lambda u, v: u + 'hello', 1)\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(lambda u, v: u + \'hello\', 1\)\")" \
        $'    [ list(ft_reduce(lambda u, v: u + \'hello\', 1)) ]'

    test "python tests/ex00/ex00_test.py \"ft_reduce(None, [1])\"" \
        "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(None, [1]\)\")" \
        $'    [ list(ft_reduce(None, [1])) ]'

    test "python tests/ex00/ex00_test.py \"ft_reduce(lambda u, v: u + v, None)\"" \
    "$(eval python tests/ex00/ex00_test.py \"functools.reduce\(lambda u, v: u + v, None\)\")" \
    $'    [ list(ft_reduce(lambda u, v: u + v, None)) ]'

}

ex01() {
    test "python $EXO_PATH/ex01/main.py" \
          $'var_0: 7\nend\nvar_0: None\nvar_1: []\nend\nvar_0: ft_lol
var_1: Hi\nend\nend\na: 10\nhello: world\nvar_0: 12\nvar_1: Yes\nvar_2: [0, 0, 0]
end\nERROR\nend\na: 10\nvar_0: 42\nvar_1: Yes\nvar_2: world\nend'\
          $'    [ main.py output vs subject output ]'
}

ex02() {
    test "python $EXO_PATH/ex02/logger.py" \
          $'boiling...\nCoffee is ready!\nboiling...\nCoffee is ready!\nboiling...\nCoffee is ready!\nboiling...\nCoffee is ready!\nPlease add water!\nPlease add water!\nBlub blub blub...'\
          $'    [ logger.py output vs subject output ]\n    [ Takes a few seconds, please hold... ]'

    supervise "cat $EXO_PATH/machine.log" \
        $'Please confirm that contents of "machine.log" correspond to the subject requirements'  

}

# ex02() {
#     cp $EXO_PATH/ex02/vector.py tests/ex02/vector.py

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0])\"" \
#           $'Value: [0.0, 1.0, 2.0, 3.0]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) ]'

#     test "python tests/ex02/vector_test.py \"Vector([1. , 2e-3, 3.14, 5.])\"" \
#           $'Value: [1.0, 0.002, 3.14, 5.0]\nShape: (1, 4)' \
#           $'    [ Vector([1. , 2e-3, 3.14, 5.]) ]'
    
#     test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'Value: [[0.0], [1.0], [2.0], [3.0]]\nShape: (4, 1)' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ]'
    
#     test "python tests/ex02/vector_test.py \"Vector(4)\"" \
#           $'Value: [[0.0], [1.0], [2.0], [3.0]]\nShape: (4, 1)' \
#           $'    [ Vector(4) ]'

#     test "python tests/ex02/vector_test.py \"Vector((10, 12))\"" \
#           $'Value: [[10.0], [11.0]]\nShape: (2, 1)' \
#           $'    [ Vector((10, 12)) ]'
    
#     test "python tests/ex02/vector_test.py \"Vector((4, 7.1))\"" \
#           $'ValueError: Bad vector initialization values' \
#           $'    [ Vector((4, 7.1)) ]'
    
#     test "python tests/ex02/vector_test.py \"Vector(-1)\"" \
#           $'ValueError: Bad vector initialization values' \
#           $'    [ Vector(-1) ]'

#     # ------------------ ADD --------------------

#     test "python tests/ex02/vector_test.py \"Vector(4) + Vector([[1.0], [1.0], [1.0], [1.0]])\"" \
#           $'Value: [[1.0], [2.0], [3.0], [4.0]]\nShape: (4, 1)' \
#           $'    [ Vector(4) + Vector([[1.0], [1.0], [1.0], [1.0]]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) + Vector([0.0, 2.0, 3.0, 4.0])\"" \
#           $'Value: [0.0, 3.0, 5.0, 7.0]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) + Vector([0.0, 2.0, 3.0, 4.0]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 2.0, 3.0, 4.0]) + Vector([0.0, 1.0, 2.0, 3.0])\"" \
#           $'Value: [0.0, 3.0, 5.0, 7.0]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 2.0, 3.0, 4.0]) + Vector([0.0, 1.0, 2.0, 3.0]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]]) + Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) + Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) + Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) + Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) + 2\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) + 2 ]'    

#     test "python tests/ex02/vector_test.py \"2 + Vector([0.0, 1.0, 2.0, 3.0])\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ 2 + Vector([0.0, 1.0, 2.0, 3.0]) ]'          

#     test "python tests/ex02/vector_test.py \"Vector(4) + Vector([0.0, 0.0, 0.0, 0.0])\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ Vector(4) + Vector([0.0, 0.0, 0.0, 0.0]) ]'    

#     test "python tests/ex02/vector_test.py \"Vector(4) + \"hello\"\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ Vector(4) + \"hello\" ]'    

#     test "python tests/ex02/vector_test.py \"Vector(4) + None\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ Vector(4) + None ]'  

#     test "python tests/ex02/vector_test.py \"None + Vector(4)\"" \
#           $'ValueError: Cannot add vectors of different dimensions' \
#           $'    [ None + Vector(4) ]'   

#     # ------------------ SUB --------------------

#     test "python tests/ex02/vector_test.py \"Vector(4) - Vector([[1.0], [1.0], [1.0], [1.0]])\"" \
#           $'Value: [[-1.0], [0.0], [1.0], [2.0]]\nShape: (4, 1)' \
#           $'    [ Vector(4) - Vector([[1.0], [1.0], [1.0], [1.0]]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) - Vector([0.0, 2.0, 3.0, 4.0])\"" \
#           $'Value: [0.0, -1.0, -1.0, -1.0]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) - Vector([0.0, 2.0, 3.0, 4.0]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 2.0, 3.0, 4.0]) - Vector([0.0, 1.0, 2.0, 3.0])\"" \
#           $'Value: [0.0, 1.0, 1.0, 1.0]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 2.0, 3.0, 4.0]) - Vector([0.0, 1.0, 2.0, 3.0]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]]) - Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'Value: [[0.0], [0.0], [0.0], [0.0]]\nShape: (4, 1)' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) - Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) - Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) - Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) - 2\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) - 2 ]'    

#     test "python tests/ex02/vector_test.py \"2 - Vector([0.0, 1.0, 2.0, 3.0])\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ 2 - Vector([0.0, 1.0, 2.0, 3.0]) ]'          

#     test "python tests/ex02/vector_test.py \"Vector(4) - Vector([0.0, 0.0, 0.0, 0.0])\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ Vector(4) - Vector([0.0, 0.0, 0.0, 0.0]) ]'    

#     test "python tests/ex02/vector_test.py \"Vector(4) - \"hello\"\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ Vector(4) - \"hello\" ]'    

#     test "python tests/ex02/vector_test.py \"Vector(4) - None\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ Vector(4) - None ]'   

#     test "python tests/ex02/vector_test.py \"None - Vector(4)\"" \
#           $'ValueError: Cannot substract vectors of different dimensions' \
#           $'    [ None - Vector(4) ]'  

#     # ------------------ DIV --------------------

#     test "python tests/ex02/vector_test.py \"Vector(4) / 2\"" \
#           $'Value: [[0.0], [0.5], [1.0], [1.5]]\nShape: (4, 1)' \
#           $'    [ Vector(4) / 2 ]'   

#     test "python tests/ex02/vector_test.py \"Vector(4) / 3.14\"" \
#           $'Value: [[0.0], [0.3184713375796178], [0.6369426751592356], [0.9554140127388535]]\nShape: (4, 1)' \
#           $'    [ Vector(4) / 3.14 ]'   

#     test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) / 2\"" \
#           $'Value: [0.0, 0.5, 1.0, 1.5]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) / 2 ]'   

#     test "python tests/ex02/vector_test.py \"Vector(4) / 0\"" \
#           $'ValueError: Can only divide a Vector by a non-zero scalar' \
#           $'    [ Vector(4) / 0 ]'   

#     test "python tests/ex02/vector_test.py \"Vector(4) / None\"" \
#           $'ValueError: Can only divide a Vector by a non-zero scalar' \
#           $'    [ Vector(4) / None ]'   

#     test "python tests/ex02/vector_test.py \"Vector(4) / \"hello\"\"" \
#           $'ValueError: Can only divide a Vector by a non-zero scalar' \
#           $'    [ Vector(4) / \"hello\" ]'    

#     test "python tests/ex02/vector_test.py \"None / Vector(4)\"" \
#           $'ValueError: A scalar cannot be divided by a Vector' \
#           $'    [ None / Vector(4) ]'          

#     test "python tests/ex02/vector_test.py \"3 / Vector(4)\"" \
#           $'ValueError: A scalar cannot be divided by a Vector' \
#           $'    [ 3 / Vector(4) ]'    

#     test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]]) / Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'ValueError: Can only divide a Vector by a non-zero scalar' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) / Vector([[0.0], [1.0], [2.0], [3.0]]) ]'     
 
#     # ------------------ MUL --------------------

#     test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"2\"" \
#           $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
#           $'    [ Vector(4) * 2 ]'   

#     test "python tests/ex02/vector_test_mul.py \"2\" \"Vector(4)\"" \
#           $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
#           $'    [ 2 * Vector(4) ]'   

#     test "python tests/ex02/vector_test_mul.py \"2.0\" \"Vector(4)\"" \
#           $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
#           $'    [ 2.0 * Vector(4) ]'   

#     test "python tests/ex02/vector_test_mul.py \"Vector([0.0, 1.0, 2.0, 3.0])\" \"2\"" \
#           $'Value: [0.0, 2.0, 4.0, 6.0]\nShape: (1, 4)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) * 2 ]'   

#     test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"0\"" \
#           $'Value: [[0.0], [0.0], [0.0], [0.0]]\nShape: (4, 1)' \
#           $'    [ Vector(4) * 0 ]'   

#     test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"None\"" \
#           $'ValueError: Can only multiply a Vector by a scalar' \
#           $'    [ Vector(4) * None ]'   

#     test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"\"hello\"\"" \
#           $'ValueError: Can only multiply a Vector by a scalar' \
#           $'    [ Vector(4) * \"hello\" ]'    

#     test "python tests/ex02/vector_test_mul.py \"None\" \"Vector(4)\"" \
#           $'ValueError: Can only multiply a Vector by a scalar' \
#           $'    [ None * Vector(4) ]'          

#     test "python tests/ex02/vector_test_mul.py \"Vector([[0.0], [1.0], [2.0], [3.0]])\" \"Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
#           $'ValueError: Can only multiply a Vector by a scalar' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) * Vector([[0.0], [1.0], [2.0], [3.0]]) ]'     
 
#     # ------------------ FORMAT --------------------

#     test "python tests/ex02/vector_test_simpleout.py \"str(Vector(4))\"" \
#           $'Values : [[0.0], [1.0], [2.0], [3.0]]\nShape : (4, 1)' \
#           $'    [ str(Vector(4)) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"repr(Vector(4))\"" \
#           $'Vector([[0.0], [1.0], [2.0], [3.0]])' \
#           $'    [ repr(Vector(4)) ]' 

#     # ------------------ DOT --------------------

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 1.0, 2.0, 3.0]).dot(Vector([0.0, 2.0, 3.0, 4.0]))\"" \
#           $'20.0' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]) ⋅ Vector([0.0, 2.0, 3.0, 4.0]) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 2.0, 3.0, 4.0]).dot(Vector([0.0, 1.0, 2.0, 3.0]))\"" \
#           $'20.0' \
#           $'    [ Vector([0.0, 2.0, 3.0, 4.0]) ⋅ Vector([0.0, 1.0, 2.0, 3.0]) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(Vector([[0.0], [1.0], [2.0], [5.0]]))\"" \
#           $'20.0' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ Vector([[0.0], [1.0], [2.0], [5.0]]) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [5.0]]).dot(Vector([[0.0], [1.0], [2.0], [3.0]]))\"" \
#           $'20.0' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [5.0]]) ⋅ Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(Vector([0.0, 1.0, 2.0, 3.0]))\"" \
#           $'ValueError: Cannot calculate dot product of vectors of different dimensions' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ Vector([0.0, 1.0, 2.0, 3.0]) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(3)\"" \
#           $'ValueError: Cannot calculate dot product of vectors of different dimensions' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ 3) ]'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(\"hello\")\"" \
#           $'ValueError: Cannot calculate dot product of vectors of different dimensions' \
#           $'    [ Vector(4) ⋅ \"hello\" ]'    

#      # ------------------ TRANSPOSE --------------------

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 1.0, 2.0, 3.0]).shape\"" \
#           $'(1, 4)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]).shape ]\n'   

#     test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 1.0, 2.0, 3.0]).T().shape\"" \
#           $'(4, 1)' \
#           $'    [ Vector([0.0, 1.0, 2.0, 3.0]).T().shape ]'   


#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).shape\"" \
#           $'(4, 1)' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]).shape ]'
    
#     test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).T().shape\"" \
#           $'(1, 4)' \
#           $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]).T().shape ]'

# }

# ex03() {
#     cp $EXO_PATH/ex03/generator.py tests/ex03/generator.py

#     test "python tests/ex03/generator_test.py 'generator(\"Le Lorem Ipsum est simplement du faux texte.\", sep=\" \")'" \
#         $'Le\nLorem\nIpsum\nest\nsimplement\ndu\nfaux\ntexte.' \
#         $'BASIC TEST generator(text, sep=\" \")'

#     test "python tests/ex03/generator_test.py 'generator(\"Le Lorem Ipsum est simplement du faux texte.\", sep=\"e\")'" \
#         $'L\n Lor\nm Ipsum \nst simpl\nm\nnt du faux t\nxt\n.' \
#         $'BASIC TEST generator(text, sep=\"e\")'

#     test "python tests/ex03/generator_test.py 'generator(\"Le Lorem Ipsum est simplement du faux texte.\", sep=\" \", option=\"ordered\")'" \
#         $'Ipsum\nLe\nLorem\ndu\nest\nfaux\nsimplement\ntexte.' \
#         $'ORDERED TEST generator(text, sep=\" \", option="ordered")'

#     test "python tests/ex03/generator_test.py 'generator(\"Lorem Ipsum Lorem Ipsum\", sep=\" \", option=\"unique\")'" \
#         $'Ipsum\nLorem' \
#         $'UNIQUE TEST generator(text, sep=\" \", option="unique")'

#     test "python tests/ex03/generator_test.py 'generator(1.0, sep=\".\")'" \
#         $'ERROR' \
#         $'BAD INPUT TEST (text not a str)'

#     test "python tests/ex03/generator_test.py 'generator(None, sep=\".\")'" \
#         $'ERROR' \
#         $'BAD INPUT TEST (None text)'

#     test "python tests/ex03/generator_test.py 'generator(\"Lorem Ipsum\", sep=\".\", option=1)'" \
#         $'ERROR' \
#         $'BAD INPUT TEST (bad option)'

#     test "python tests/ex03/generator_test.py 'generator(\"Lorem Ipsum\", sep=\".\", option=\"bliblou\")'" \
#         $'ERROR' \
#         $'BAD INPUT TEST (bad option)'

#     supervise "python tests/ex03/generator_test_shuffle.py" \
#         $'Please confirm that the shuffled output contains the words of the sentence: \"Le Lorem Ipsum est simplement du faux texte.\"'  
# }

# ex04() {
#     cp $EXO_PATH/ex04/eval.py tests/eval.py

#     test "python tests/eval_test.py '[\"Le\", \"Lorem\", \"Ipsum\", \"est\", \"simple\"]' '[1.0, 2.0, 1.0, 4.0, 0.5]'" \
#         $'zip: 32.0\nenum: 32.0' \
#         $' --- CORRECT INPUT --- '
    
#     test "python tests/eval_test.py '[\"Le\", \"Lorem\", \"Ipsum\", \"est\", \"simple\", \"hehe\"]' '[1.0, 2.0, 1.0, 4.0, 0.5, 12]'" \
#         $'zip: 80.0\nenum: 80.0' \
#         $' --- CORRECT INPUT --- '

#     test "python tests/eval_test.py '[\"Le\", \"Lorem\"]' '[1.0, 2.0]'" \
#         $'zip: 12.0\nenum: 12.0' \
#         $' --- CORRECT INPUT --- '

#     test "python tests/eval_test.py '[\"Le\"]' '[1.0]'" \
#         $'zip: 2.0\nenum: 2.0' \
#         $' --- CORRECT INPUT --- '

#     test "python tests/eval_test.py '[\"Le\"]' '[1.0, 2.0]'" \
#         $'zip: -1\nenum: -1' \
#         $' --- BAD INPUT (diff length) --- '

#     test "python tests/eval_test.py '[\"Le\", 1]' '[1.0, 2.0]'" \
#         $'zip: -1\nenum: -1' \
#         $' --- BAD INPUT (words contain a number) --- '

#     test "python tests/eval_test.py '[\"Le\", \"bla\"]' '[1.0, \"2.0\"]'" \
#         $'zip: -1\nenum: -1' \
#         $' --- BAD INPUT (coefs contain a string) --- '

#     test "python tests/eval_test.py '[\"Le\", \"bla\"]' 'None'" \
#         $'zip: -1\nenum: -1' \
#         $' --- BAD INPUT (coefs None) --- '

# }

# ex05() {
#     cp $EXO_PATH/ex05/the_bank.py tests/ex05/the_bank.py
    
#     test "python tests/ex05/banking_test1.py" \
#         $'Failed\nSuccess' \
#         $'Subject test 1 (transfer fail - fix - transfer ok)'

#     test "python tests/ex05/banking_test2.py" \
#         $'Failed\nSuccess' \
#         $'Subject test 2 (transfer fail - fix - transfer ok)'
    
#     supervise "python tests/ex05/bank_test.py" \
#           $'Please confirm that the output is correct'

# }
