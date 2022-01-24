from game import GotCharacter, Stark

# print("\n --- Creating Stark(\"Elmo\") --- ")
elmo = Stark("Elmo")
# print(elmo.__dict__)

# print("\n --- elmo.is_alive --- ")
print(elmo.is_alive)

# print("\n --- elmo.die() --- ")
elmo.die()
# print("\n --- elmo.is_alive --- ")
print(elmo.is_alive)
