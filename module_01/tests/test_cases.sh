ex00() {
    supervise "python $EXO_PATH/ex00/test.py" \
          $'Please confirm that the output is correct'
}

ex01() {
    cp $EXO_PATH/ex01/game.py tests/ex01/game.py
    test "python tests/ex01/game_test0.py" \
          $'{\'first_name\': \'Arya\', \'is_alive\': True, \'family_name\': \'Stark\', \'house_words\': \'Winter is Coming\'}'\
          $'    [ arya = Stark("Arya") ]\n    [ print(arya.__dict__) ]'

    test "python tests/ex01/game_test1.py" \
          $'Winter is Coming' \
          $'    [ arya.print_house_words() ]'

    test "python tests/ex01/game_test2.py" \
          $'True\nFalse' \
          $'    [ print(arya.is_alive) ]\n    [ arya.die() ]\n    [ print(arya.is_alive) ]'

    test "python tests/ex01/game_test3.py" \
          $'{\'first_name\': \'Elmo\', \'is_alive\': True, \'family_name\': \'Stark\', \'house_words\': \'Winter is Coming\'}'\
          $'    [ elmo = Stark("Elmo") ]\n    [ print(elmo.__dict__) ]'

    test "python tests/ex01/game_test4.py" \
          $'Winter is Coming' \
          $'    [ elmo.print_house_words() ]'

    test "python tests/ex01/game_test5.py" \
          $'True\nFalse' \
          $'    [ print(elmo.is_alive) ]\n    [ elmo.die() ]\n    [ print(elmo.is_alive) ]'

    test "python tests/ex01/game_test6.py" \
          $'A class representing the Stark family. Or when bad things happen to good people.' \
          $'    [ print(elmo.__doc__) ]'
}

ex02() {
    cp $EXO_PATH/ex02/vector.py tests/ex02/vector.py

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0])\"" \
          $'Value: [0.0, 1.0, 2.0, 3.0]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) ]'

    test "python tests/ex02/vector_test.py \"Vector([1. , 2e-3, 3.14, 5.])\"" \
          $'Value: [1.0, 0.002, 3.14, 5.0]\nShape: (1, 4)' \
          $'    [ Vector([1. , 2e-3, 3.14, 5.]) ]'
    
    test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'Value: [[0.0], [1.0], [2.0], [3.0]]\nShape: (4, 1)' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ]'
    
    test "python tests/ex02/vector_test.py \"Vector(4)\"" \
          $'Value: [[0.0], [1.0], [2.0], [3.0]]\nShape: (4, 1)' \
          $'    [ Vector(4) ]'

    test "python tests/ex02/vector_test.py \"Vector((10, 12))\"" \
          $'Value: [[10.0], [11.0]]\nShape: (2, 1)' \
          $'    [ Vector((10, 12)) ]'
    
    test "python tests/ex02/vector_test.py \"Vector((4, 7.1))\"" \
          $'ValueError: Bad vector initialization values' \
          $'    [ Vector((4, 7.1)) ]'
    
    test "python tests/ex02/vector_test.py \"Vector(-1)\"" \
          $'ValueError: Bad vector initialization values' \
          $'    [ Vector(-1) ]'

    # ------------------ ADD --------------------

    test "python tests/ex02/vector_test.py \"Vector(4) + Vector([[1.0], [1.0], [1.0], [1.0]])\"" \
          $'Value: [[1.0], [2.0], [3.0], [4.0]]\nShape: (4, 1)' \
          $'    [ Vector(4) + Vector([[1.0], [1.0], [1.0], [1.0]]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) + Vector([0.0, 2.0, 3.0, 4.0])\"" \
          $'Value: [0.0, 3.0, 5.0, 7.0]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) + Vector([0.0, 2.0, 3.0, 4.0]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 2.0, 3.0, 4.0]) + Vector([0.0, 1.0, 2.0, 3.0])\"" \
          $'Value: [0.0, 3.0, 5.0, 7.0]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 2.0, 3.0, 4.0]) + Vector([0.0, 1.0, 2.0, 3.0]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]]) + Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) + Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) + Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) + Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) + 2\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) + 2 ]'    

    test "python tests/ex02/vector_test.py \"2 + Vector([0.0, 1.0, 2.0, 3.0])\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ 2 + Vector([0.0, 1.0, 2.0, 3.0]) ]'          

    test "python tests/ex02/vector_test.py \"Vector(4) + Vector([0.0, 0.0, 0.0, 0.0])\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ Vector(4) + Vector([0.0, 0.0, 0.0, 0.0]) ]'    

    test "python tests/ex02/vector_test.py \"Vector(4) + \"hello\"\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ Vector(4) + \"hello\" ]'    

    test "python tests/ex02/vector_test.py \"Vector(4) + None\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ Vector(4) + None ]'  

    test "python tests/ex02/vector_test.py \"None + Vector(4)\"" \
          $'ValueError: Cannot add vectors of different dimensions' \
          $'    [ None + Vector(4) ]'   

    # ------------------ SUB --------------------

    test "python tests/ex02/vector_test.py \"Vector(4) - Vector([[1.0], [1.0], [1.0], [1.0]])\"" \
          $'Value: [[-1.0], [0.0], [1.0], [2.0]]\nShape: (4, 1)' \
          $'    [ Vector(4) - Vector([[1.0], [1.0], [1.0], [1.0]]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) - Vector([0.0, 2.0, 3.0, 4.0])\"" \
          $'Value: [0.0, -1.0, -1.0, -1.0]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) - Vector([0.0, 2.0, 3.0, 4.0]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 2.0, 3.0, 4.0]) - Vector([0.0, 1.0, 2.0, 3.0])\"" \
          $'Value: [0.0, 1.0, 1.0, 1.0]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 2.0, 3.0, 4.0]) - Vector([0.0, 1.0, 2.0, 3.0]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]]) - Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'Value: [[0.0], [0.0], [0.0], [0.0]]\nShape: (4, 1)' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) - Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) - Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) - Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) - 2\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) - 2 ]'    

    test "python tests/ex02/vector_test.py \"2 - Vector([0.0, 1.0, 2.0, 3.0])\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ 2 - Vector([0.0, 1.0, 2.0, 3.0]) ]'          

    test "python tests/ex02/vector_test.py \"Vector(4) - Vector([0.0, 0.0, 0.0, 0.0])\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ Vector(4) - Vector([0.0, 0.0, 0.0, 0.0]) ]'    

    test "python tests/ex02/vector_test.py \"Vector(4) - \"hello\"\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ Vector(4) - \"hello\" ]'    

    test "python tests/ex02/vector_test.py \"Vector(4) - None\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ Vector(4) - None ]'   

    test "python tests/ex02/vector_test.py \"None - Vector(4)\"" \
          $'ValueError: Cannot substract vectors of different dimensions' \
          $'    [ None - Vector(4) ]'  

    # ------------------ DIV --------------------

    test "python tests/ex02/vector_test.py \"Vector(4) / 2\"" \
          $'Value: [[0.0], [0.5], [1.0], [1.5]]\nShape: (4, 1)' \
          $'    [ Vector(4) / 2 ]'   

    test "python tests/ex02/vector_test.py \"Vector(4) / 3.14\"" \
          $'Value: [[0.0], [0.3184713375796178], [0.6369426751592356], [0.9554140127388535]]\nShape: (4, 1)' \
          $'    [ Vector(4) / 3.14 ]'   

    test "python tests/ex02/vector_test.py \"Vector([0.0, 1.0, 2.0, 3.0]) / 2\"" \
          $'Value: [0.0, 0.5, 1.0, 1.5]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) / 2 ]'   

    test "python tests/ex02/vector_test.py \"Vector(4) / 0\"" \
          $'ValueError: Can only divide a Vector by a non-zero scalar' \
          $'    [ Vector(4) / 0 ]'   

    test "python tests/ex02/vector_test.py \"Vector(4) / None\"" \
          $'ValueError: Can only divide a Vector by a non-zero scalar' \
          $'    [ Vector(4) / None ]'   

    test "python tests/ex02/vector_test.py \"Vector(4) / \"hello\"\"" \
          $'ValueError: Can only divide a Vector by a non-zero scalar' \
          $'    [ Vector(4) / \"hello\" ]'    

    test "python tests/ex02/vector_test.py \"None / Vector(4)\"" \
          $'ValueError: A scalar cannot be divided by a Vector' \
          $'    [ None / Vector(4) ]'          

    test "python tests/ex02/vector_test.py \"3 / Vector(4)\"" \
          $'ValueError: A scalar cannot be divided by a Vector' \
          $'    [ 3 / Vector(4) ]'    

    test "python tests/ex02/vector_test.py \"Vector([[0.0], [1.0], [2.0], [3.0]]) / Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'ValueError: Can only divide a Vector by a non-zero scalar' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) / Vector([[0.0], [1.0], [2.0], [3.0]]) ]'     
 
    # ------------------ MUL --------------------

    test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"2\"" \
          $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
          $'    [ Vector(4) * 2 ]'   

    test "python tests/ex02/vector_test_mul.py \"2\" \"Vector(4)\"" \
          $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
          $'    [ 2 * Vector(4) ]'   

    test "python tests/ex02/vector_test_mul.py \"2.0\" \"Vector(4)\"" \
          $'Value: [[0.0], [2.0], [4.0], [6.0]]\nShape: (4, 1)' \
          $'    [ 2.0 * Vector(4) ]'   

    test "python tests/ex02/vector_test_mul.py \"Vector([0.0, 1.0, 2.0, 3.0])\" \"2\"" \
          $'Value: [0.0, 2.0, 4.0, 6.0]\nShape: (1, 4)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) * 2 ]'   

    test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"0\"" \
          $'Value: [[0.0], [0.0], [0.0], [0.0]]\nShape: (4, 1)' \
          $'    [ Vector(4) * 0 ]'   

    test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"None\"" \
          $'ValueError: Can only multiply a Vector by a scalar' \
          $'    [ Vector(4) * None ]'   

    test "python tests/ex02/vector_test_mul.py \"Vector(4)\" \"\"hello\"\"" \
          $'ValueError: Can only multiply a Vector by a scalar' \
          $'    [ Vector(4) * \"hello\" ]'    

    test "python tests/ex02/vector_test_mul.py \"None\" \"Vector(4)\"" \
          $'ValueError: Can only multiply a Vector by a scalar' \
          $'    [ None * Vector(4) ]'          

    test "python tests/ex02/vector_test_mul.py \"Vector([[0.0], [1.0], [2.0], [3.0]])\" \"Vector([[0.0], [1.0], [2.0], [3.0]])\"" \
          $'ValueError: Can only multiply a Vector by a scalar' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) * Vector([[0.0], [1.0], [2.0], [3.0]]) ]'     
 
    # ------------------ FORMAT --------------------

    test "python tests/ex02/vector_test_simpleout.py \"str(Vector(4))\"" \
          $'Values : [[0.0], [1.0], [2.0], [3.0]]\nShape : (4, 1)' \
          $'    [ str(Vector(4)) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"repr(Vector(4))\"" \
          $'Vector([[0.0], [1.0], [2.0], [3.0]])' \
          $'    [ repr(Vector(4)) ]' 

    # ------------------ DOT --------------------

    test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 1.0, 2.0, 3.0]).dot(Vector([0.0, 2.0, 3.0, 4.0]))\"" \
          $'20.0' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]) ⋅ Vector([0.0, 2.0, 3.0, 4.0]) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 2.0, 3.0, 4.0]).dot(Vector([0.0, 1.0, 2.0, 3.0]))\"" \
          $'20.0' \
          $'    [ Vector([0.0, 2.0, 3.0, 4.0]) ⋅ Vector([0.0, 1.0, 2.0, 3.0]) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(Vector([[0.0], [1.0], [2.0], [5.0]]))\"" \
          $'20.0' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ Vector([[0.0], [1.0], [2.0], [5.0]]) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [5.0]]).dot(Vector([[0.0], [1.0], [2.0], [3.0]]))\"" \
          $'20.0' \
          $'    [ Vector([[0.0], [1.0], [2.0], [5.0]]) ⋅ Vector([[0.0], [1.0], [2.0], [3.0]]) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(Vector([0.0, 1.0, 2.0, 3.0]))\"" \
          $'ValueError: Cannot calculate dot product of vectors of different dimensions' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ Vector([0.0, 1.0, 2.0, 3.0]) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(3)\"" \
          $'ValueError: Cannot calculate dot product of vectors of different dimensions' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]) ⋅ 3) ]'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).dot(\"hello\")\"" \
          $'ValueError: Cannot calculate dot product of vectors of different dimensions' \
          $'    [ Vector(4) ⋅ \"hello\" ]'    

     # ------------------ TRANSPOSE --------------------

    test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 1.0, 2.0, 3.0]).shape\"" \
          $'(1, 4)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]).shape ]\n'   

    test "python tests/ex02/vector_test_simpleout.py \"Vector([0.0, 1.0, 2.0, 3.0]).T().shape\"" \
          $'(4, 1)' \
          $'    [ Vector([0.0, 1.0, 2.0, 3.0]).T().shape ]'   


    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).shape\"" \
          $'(4, 1)' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]).shape ]'
    
    test "python tests/ex02/vector_test_simpleout.py \"Vector([[0.0], [1.0], [2.0], [3.0]]).T().shape\"" \
          $'(1, 4)' \
          $'    [ Vector([[0.0], [1.0], [2.0], [3.0]]).T().shape ]'

}

ex03() {
    cp $EXO_PATH/ex03/generator.py tests/ex03/generator.py

    test "python tests/ex03/generator_test.py 'generator(\"Le Lorem Ipsum est simplement du faux texte.\", sep=\" \")'" \
        $'Le\nLorem\nIpsum\nest\nsimplement\ndu\nfaux\ntexte.' \
        $'BASIC TEST generator(text, sep=\" \")'

    test "python tests/ex03/generator_test.py 'generator(\"Le Lorem Ipsum est simplement du faux texte.\", sep=\"e\")'" \
        $'L\n Lor\nm Ipsum \nst simpl\nm\nnt du faux t\nxt\n.' \
        $'BASIC TEST generator(text, sep=\"e\")'

    test "python tests/ex03/generator_test.py 'generator(\"Le Lorem Ipsum est simplement du faux texte.\", sep=\" \", option=\"ordered\")'" \
        $'Ipsum\nLe\nLorem\ndu\nest\nfaux\nsimplement\ntexte.' \
        $'ORDERED TEST generator(text, sep=\" \", option="ordered")'

    test "python tests/ex03/generator_test.py 'generator(\"Lorem Ipsum Lorem Ipsum\", sep=\" \", option=\"unique\")'" \
        $'Ipsum\nLorem' \
        $'UNIQUE TEST generator(text, sep=\" \", option="unique")'

    test "python tests/ex03/generator_test.py 'generator(1.0, sep=\".\")'" \
        $'ERROR' \
        $'BAD INPUT TEST (text not a str)'

    test "python tests/ex03/generator_test.py 'generator(None, sep=\".\")'" \
        $'ERROR' \
        $'BAD INPUT TEST (None text)'

    test "python tests/ex03/generator_test.py 'generator(\"Lorem Ipsum\", sep=\".\", option=1)'" \
        $'ERROR' \
        $'BAD INPUT TEST (bad option)'

    test "python tests/ex03/generator_test.py 'generator(\"Lorem Ipsum\", sep=\".\", option=\"bliblou\")'" \
        $'ERROR' \
        $'BAD INPUT TEST (bad option)'

    supervise "python tests/ex03/generator_test_shuffle.py" \
        $'Please confirm that the shuffled output contains the words of the sentence: \"Le Lorem Ipsum est simplement du faux texte.\"'  
}

ex04() {
    cp $EXO_PATH/ex04/eval.py tests/eval.py

    test "python tests/eval_test.py '[\"Le\", \"Lorem\", \"Ipsum\", \"est\", \"simple\"]' '[1.0, 2.0, 1.0, 4.0, 0.5]'" \
        $'zip: 32.0\nenum: 32.0' \
        $' --- CORRECT INPUT --- '
    
    test "python tests/eval_test.py '[\"Le\", \"Lorem\", \"Ipsum\", \"est\", \"simple\", \"hehe\"]' '[1.0, 2.0, 1.0, 4.0, 0.5, 12]'" \
        $'zip: 80.0\nenum: 80.0' \
        $' --- CORRECT INPUT --- '

    test "python tests/eval_test.py '[\"Le\", \"Lorem\"]' '[1.0, 2.0]'" \
        $'zip: 12.0\nenum: 12.0' \
        $' --- CORRECT INPUT --- '

    test "python tests/eval_test.py '[\"Le\"]' '[1.0]'" \
        $'zip: 2.0\nenum: 2.0' \
        $' --- CORRECT INPUT --- '

    test "python tests/eval_test.py '[\"Le\"]' '[1.0, 2.0]'" \
        $'zip: -1\nenum: -1' \
        $' --- BAD INPUT (diff length) --- '

    test "python tests/eval_test.py '[\"Le\", 1]' '[1.0, 2.0]'" \
        $'zip: -1\nenum: -1' \
        $' --- BAD INPUT (words contain a number) --- '

    test "python tests/eval_test.py '[\"Le\", \"bla\"]' '[1.0, \"2.0\"]'" \
        $'zip: -1\nenum: -1' \
        $' --- BAD INPUT (coefs contain a string) --- '

    test "python tests/eval_test.py '[\"Le\", \"bla\"]' 'None'" \
        $'zip: -1\nenum: -1' \
        $' --- BAD INPUT (coefs None) --- '

}

ex05() {
    cp $EXO_PATH/ex05/the_bank.py tests/ex05/the_bank.py
    
    test "python tests/ex05/banking_test1.py" \
        $'Failed\nSuccess' \
        $'Subject test 1 (transfer fail - fix - transfer ok)'

    test "python tests/ex05/banking_test2.py" \
        $'Failed\nSuccess' \
        $'Subject test 2 (transfer fail - fix - transfer ok)'
    
    supervise "python tests/ex05/bank_test.py" \
          $'Please confirm that the output is correct'

}
