#!/usr/bin/python

import sys


def format_string(word):
    word = list(word)
    word.reverse()
    for n in range(len(word)):
        if word[n].isupper():
            word[n] = word[n].lower()
        elif word[n].islower():
            word[n] = word[n].upper()
    return ''.join(word)


if len(sys.argv) >= 2:
    input_txt = (' '.join(sys.argv[1:len(sys.argv)])).split()
    input_txt.reverse()
    print(' '.join(map(format_string, input_txt)))
