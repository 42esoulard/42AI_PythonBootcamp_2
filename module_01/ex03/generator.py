from random import randint as randint


def shuffle(text):
    res = [0] * len(text)
    i = 0
    while i < len(text):
        index = randint(0, len(text) - 1)
        if res[index] != 0:
            continue
        res[index] = text[i]
        i += 1
    return res


def generator(text, sep=" ", option=None):
    if not isinstance(text, str):
        print('ERROR')
        return

    text = text.split(sep)
    if option == 'shuffle':
        text = shuffle(text)
    elif option == 'unique':
        text = sorted(set(text))
    elif option == 'ordered':
        text = sorted(text)
    elif option:
        print('ERROR')
        return
    for part in text:
        yield part
