import string


def format_result(chars, up, low, punc, space):
    print(f'The test contains {chars} characters:\n'
          f'- {up} upper letters\n'
          f'- {low} lower letters\n'
          f'- {punc} punctuation marks\n'
          f'- {space} spaces')


def text_analyzer(*args):
    """This function counts the number of upper characters, lower characters,
punctuation and spaces in a given text."""

    if len(args) == 0:
        print('What is the text to analyse?')
        return text_analyzer(input(''))
    elif len(args) != 1:
        print('ERROR')
        return

    text = args[0]
    if not isinstance(text, str):
        print('ERROR')
    else:
        format_result(
            len(text),
            sum(map(str.isupper, text)),
            sum(map(str.islower, text)),
            sum(map(lambda n: n in string.punctuation, text)),
            sum(map(lambda n: n == ' ', text)))
