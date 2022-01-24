cookbook = {
  'sandwich': {
    'ingredients': ['ham', 'bread', 'cheese'],
    'meal': 'lunch',
    'prep_time': 10
  },
  'cake': {
    'ingredients': ['flour', 'sugar', 'eggs'],
    'meal': 'dessert',
    'prep_time': 60
  },
  'salad': {
    'ingredients': ['avocado', 'arugula', 'tomatoes', 'spinach'],
    'meal': 'lunch',
    'prep_time': 15
  }
}


def add_recipe():
    name = input('Name of the recipe: ')

    ingredients = []
    ingredients.append(input('Add an ingredient: '))
    while True:
        answer = input('Add another ingredient? (y/n) ')
        if answer == 'n':
            break
        elif answer != 'y':
            print('...wut?')
            continue
        ingredients.append(input('Add an ingredient: '))

    meal = input(f'What is the best time to eat {name}? ')

    prep_time = input(f'How long does it take to cook (in minutes)? ')
    while True:
        try:
            int(prep_time)
            break
        except ValueError:
            print('Cooking time must be a number!')
            prep_time = input(f'How long does it take to cook (in minutes)? ')

    cookbook[name] = {
        'ingredients': ingredients,
        'meal': meal,
        'prep_time': prep_time
    }

    print(f'Success :D {name} has been added to the Cookbook!')


def delete_recipe(recipe):
    if recipe not in cookbook:
        return print('Recipe not found!')
    cookbook.pop(recipe)
    print(f'{recipe} has been successfully deleted from the cookbook!')


def print_recipe(recipe):
    if recipe not in cookbook:
        return print('Recipe not found!')
    print(f'Recipe for {recipe}:\n'
          f'Ingredients list: {cookbook[recipe]["ingredients"]}\n'
          f'To be eaten for {cookbook[recipe]["meal"]}.\n'
          f'Takes {str(cookbook[recipe]["prep_time"])} minutes of cooking.')


def print_cookbook():
    if len(cookbook) == 0:
        return print('The cookbook is empty...')
    for key in cookbook:
        title = "| " + key + " |"
        print("|" + ''.center(len(title) - 2, '-') + "|")
        print(title)
        print("|" + ''.center(len(title) - 2, '-') + "|")
        for subkey, val in cookbook[key].items():
            print(f'{"".rjust(3) + "L " + subkey}')
            if subkey == 'ingredients':
                for ingredient in cookbook[key][subkey]:
                    print(f'{" ".rjust(6) + "| " + ingredient}')
            elif subkey == 'prep_time':
                print(f'{" ".rjust(6) + "| " + str(val)} minutes')
            else:
                print(f'{" ".rjust(6) + "| " + val}')


while True:
    print('Please select an option by typing the corresponding number:\n'
          '1: Add a recipe\n'
          '2: Delete a recipe\n'
          '3: Print a recipe\n'
          '4: Print the cookbook\n'
          '5: Quit')
    user_input = input()
    print('\n')

    if user_input == '1':
        add_recipe()
    elif user_input == '2':
        delete_recipe(input('Please enter the name of the '
                            'recipe you wish to delete: '))
    elif user_input == '3':
        print_recipe(input('Please enter the recipe\'s name '
                           'to get its details: '))
    elif user_input == '4':
        print_cookbook()
    elif user_input == '5':
        print('Cookbook closed')
        break
    else:
        print('This option does not exist, please type '
              'the corresponding number.\nTo exit, enter 5.')

    print('\n')
