class Evaluator:

    """The two functions compute the sum of the \
lengths of every words of a given list weighted \
by a list a coefs"""

    def __init__(self):
        pass

    def check_params(coefs, words):
        if (not isinstance(coefs, list) or not isinstance(words, list)
            or not all(isinstance(n, (int, float)) for n in coefs)
            or not all(isinstance(n, str) for n in words)
                or len(coefs) != len(words)):
            return -1
        return 0

    def zip_evaluate(coefs, words):
        if Evaluator.check_params(coefs, words) == -1:
            return -1
        zipped = list(zip(words, coefs))
        res = 0
        for pair in zipped:
            res += len(pair[0]) * pair[1]
        return res

    def enumerate_evaluate(coefs, words):
        if Evaluator.check_params(coefs, words) == -1:
            return -1
        res = 0
        for count, coef in enumerate(coefs):
            res += coef * len(words[count])
        return res
