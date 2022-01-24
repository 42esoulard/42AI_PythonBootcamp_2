from generator import generator
import sys

if len(sys.argv) == 2:
    try:
        for word in eval(sys.argv[1]):
            print(word)
    except ValueError as e:
        print(f'ValueError: {e}')


# print(" --- BASIC TEST generator(text, sep=\" \") --- ")
# text = "Le Lorem Ipsum est simplement du faux texte."
# for word in generator(text, sep=" "):
#     print(word)

# print("\n --- BASIC TEST generator(text, sep=\"e\") --- ")
# text = "Le Lorem Ipsum est simplement du faux texte."
# for word in generator(text, sep="e"):
#     print(word)


# print("\n --- ORDERED TEST --- ")
# for word in generator(text, sep=" ", option="ordered"):
#     print(word)


# print("\n --- UNIQUE TEST IN \"Lorem Ipsum Lorem Ipsum\" --- ")
# text = "Lorem Ipsum Lorem Ipsum"
# for word in generator(text, sep=" ", option="unique"):
#     print(word)


# print("\n --- BAD INPUT TEST (not a str) --- ")
# text = 1.0
# for word in generator(text, sep="."):
#     print(word)

# print("\n --- BAD INPUT TEST (None) --- ")
# text = None
# for word in generator(text, sep="."):
#     print(word)

# print("\n --- BAD INPUT TEST (option=1) --- ")
# text = "Lorem Ipsum Lorem Ipsum"
# for word in generator(text, sep=None, option=1):
#     print(word)

# print("\n --- BAD INPUT TEST (option=\"bliblou\") --- ")
# for word in generator(text, sep=None, option="bliblou"):
#     print(word)