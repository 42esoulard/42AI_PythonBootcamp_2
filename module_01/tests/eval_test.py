from eval import Evaluator
import sys

if len(sys.argv) == 3:
    try:
        print(f'zip: {Evaluator.zip_evaluate(eval(sys.argv[2]), eval(sys.argv[1]))}')
        print(f'enum: {Evaluator.enumerate_evaluate(eval(sys.argv[2]), eval(sys.argv[1]))}')
    except ValueError as e:
        print(f'ValueError: {e}')

# print(' --- CORRECT INPUT --- ')
# print('words = ["Le", "Lorem", "Ipsum", "est", "simple"]\n'
#       'coefs = [1.0, 2.0, 1.0, 4.0, 0.5]')
# words = ["Le", "Lorem", "Ipsum", "est", "simple"]
# coefs = [1.0, 2.0, 1.0, 4.0, 0.5]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- CORRECT INPUT --- ')
# print('words = ["Le", "Lorem", "Ipsum", "est", "simple", "hehe"]\n'
#       'coefs = [1.0, 2.0, 1.0, 4.0, 0.5, 12]')
# words = ["Le", "Lorem", "Ipsum", "est", "simple", "hehe"]
# coefs = [1.0, 2.0, 1.0, 4.0, 0.5, 12]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- CORRECT INPUT --- ')
# print('words = ["Le", "Lorem"]\n'
#       'coefs = [1.0, 2.0]')
# words = ["Le", "Lorem"]
# coefs = [1.0, 2.0]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- CORRECT INPUT --- ')
# print('words = ["Le"]\n'
#       'coefs = [1.0]')
# words = ["Le"]
# coefs = [1.0]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- BAD INPUT (diff length)--- ')
# words = ["Le", "Lorem", "Ipsum", "n\'", "est", "pas", "simple"]
# coefs = [0.0, -1.0, 1.0, -12.0, 0.0, 42.42]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- BAD INPUT (words contains a number)--- ')
# words = ["Le", 3, "Ipsum", "n\'", "est", "pas", "simple"]
# coefs = [0.0, -1.0, 1.0, -12.0, 0.0, 42.42, 2]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- BAD INPUT (coefs contain a string)--- ')
# words = ["Le", "Lorem", "Ipsum", "n\'", "est", "pas", "simple"]
# coefs = [0.0, "a", 1.0, -12.0, 0.0, 42.42, 2]
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')

# print(' --- BAD INPUT (coefs None)--- ')
# words = ["Le", "Lorem", "Ipsum", "n\'", "est", "pas", "simple"]
# coefs = None
# print(f'zip:  {Evaluator.zip_evaluate(coefs, words)}')
# print(f'enum: {Evaluator.enumerate_evaluate(coefs, words)}')
