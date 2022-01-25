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

ex03() {
    cp $EXO_PATH/ex03/csvreader.py tests/ex03/csvreader.py

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/good.csv', header=True)\"" \
          $'[\'"Name"\', \'     "Sex"\', \' "Age"\', \' "Height (in)"\', \' "Weight (lbs)"\']\n[[\'"Name"\', \'     "Sex"\', \' "Age"\', \' "Height (in)"\', \' "Weight (lbs)"\'], [\'"Alex"\', \'       "M"\', \'   41\', \'       74\', \'      170\'], [\'"Bert"\', \'       "M"\', \'   42\', \'       68\', \'      166\'], [\'"Carl"\', \'       "M"\', \'   32\', \'       70\', \'      155\'], [\'"Dave"\', \'       "M"\', \'   39\', \'       72\', \'      167\'], [\'"Elly"\', \'       "F"\', \'   30\', \'       66\', \'      124\'], [\'"Fran"\', \'       "F"\', \'   33\', \'       66\', \'      115\'], [\'"Gwen"\', \'       "F"\', \'   26\', \'       64\', \'      121\'], [\'"Hank"\', \'       "M"\', \'   30\', \'       71\', \'      158\'], [\'"Ivan"\', \'       "M"\', \'   53\', \'       72\', \'      175\'], [\'"Jake"\', \'       "M"\', \'   32\', \'       69\', \'      143\'], [\'"Kate"\', \'       "F"\', \'   47\', \'       69\', \'      139\'], [\'"Luke"\', \'       "M"\', \'   34\', \'       72\', \'      163\'], [\'"Myra"\', \'       "F"\', \'   23\', \'       62\', \'       98\'], [\'"Neil"\', \'       "M"\', \'   36\', \'       75\', \'      160\'], [\'"Omar"\', \'       "M"\', \'   38\', \'       70\', \'      145\'], [\'"Page"\', \'       "F"\', \'   31\', \'       67\', \'      135\'], [\'"Quin"\', \'       "M"\', \'   29\', \'       71\', \'      176\'], [\'"Ruth"\', \'       "F"\', \'   28\', \'       65\', \'      131\']]' \
          $'    [ CsvReader(\'tests/ex03/good.csv\', header=True) ]'

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/good.csv', skip_top=18, skip_bottom=0)\"" \
          $'None\n[[\'"Ruth"\', \'       "F"\', \'   28\', \'       65\', \'      131\']]' \
          $'    [ CsvReader(\'tests/ex03/good.csv\', skip_top=18, skip_bottom=0) ]'

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/good.csv', header = True, skip_top=17, skip_bottom=0)\"" \
          $'[\'"Name"\', \'     "Sex"\', \' "Age"\', \' "Height (in)"\', \' "Weight (lbs)"\']\n[[\'"Quin"\', \'       "M"\', \'   29\', \'       71\', \'      176\'], [\'"Ruth"\', \'       "F"\', \'   28\', \'       65\', \'      131\']]' \
          $'    [ CsvReader(\'tests/ex03/good.csv\', header = True, skip_top=17, skip_bottom=0) ]'

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/bad.csv', header=True)\"" \
          $'File is corrupted or missing' \
          $'    [ CsvReader(\'tests/ex03/bad.csv\', header=True) ]'

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/bad.csv', skip_top=18, skip_bottom=0)\"" \
          $'File is corrupted or missing' \
          $'    [ CsvReader(\'tests/ex03/bad.csv\', skip_top=18, skip_bottom=0) ]'

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/bad.csv', skip_top=17, skip_bottom=0)\"" \
          $'File is corrupted or missing' \
          $'    [ CsvReader(\'tests/ex03/bad.csv\', skip_top=17, skip_bottom=0) ]'

    test "python tests/ex03/csv_test.py \"CsvReader('tests/ex03/bidon.csv', skip_top=17, skip_bottom=0)\"" \
          $'File is corrupted or missing' \
          $'    [ CsvReader(\'tests/ex03/bidon.csv\', skip_top=17, skip_bottom=0) ]'


}
