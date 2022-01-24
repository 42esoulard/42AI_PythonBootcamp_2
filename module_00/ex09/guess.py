import random


print(f'This is an interactive guessing game!\n'
      f'You have to enter a number between 1 and 99 to find '
      'out the secret number.\n'
      f'Type \'exit\' to end the game.\n'
      f'Good luck!\n')


attempt = 0
secret_nb = random.randint(1, 99)
# secret_nb = 42
guess = '0'

while int(guess) != secret_nb:

    print(f'What\'s your guess between 1 and 99?')
    guess = input()
    attempt += 1

    if guess == 'exit':
        print('Goodbye!')
        break
    elif not guess.isnumeric():
        print('That\'s not a number.')
        guess = 0
    elif int(guess) > secret_nb:
        print('Too high!')
    elif int(guess) < secret_nb:
        print('Too low!')
    else:
        if (secret_nb == 42):
            print('The answer to the ultimate question of life,'
                  ' the universe and everything is 42.')

        if attempt == 1:
            print('Congratulations! You got it on your first try!')
        else:
            print(f'Congratulations, you\'ve got it!\n'
                  f'You won in {attempt} attempts!')
