class Recipe:

    def error(self, msg):
        print(f'Error: {msg}')
        exit()

    def __init__(self, name, lvl, time, ingr, typ, desc=''):
        self.name = name
        self.description = desc

        try:
            self.cooking_lvl = int(lvl)
            if self.cooking_lvl < 1 or self.cooking_lvl > 5:
                raise ValueError()
        except ValueError:
            self.error('Recipe - cooking_lvl must be an int in range 1-5')

        try:
            self.cooking_time = int(time)
            if self.cooking_time < 0:
                raise ValueError()
        except ValueError:
            self.error('Recipe - cooking_time must be a positive int')

        try:
            if not isinstance(ingr, list):
                raise ValueError()
            elif not all(isinstance(n, str) for n in ingr):
                raise ValueError()
            self.ingredients = ingr
        except ValueError:
            self.error('Recipe - ingredients must be a list of strings')

        try:
            if typ not in ["starter", "lunch", "dessert"]:
                raise ValueError()
            self.recipe_type = typ
        except ValueError:
            self.error('Recipe - recipe_type must be a "starter",' +
                       ' "lunch" or "dessert"')

    def __str__(self):
        """Return the string to print with the recipe info"""
        return 'Recipe name: ' + self.name + '\n' + \
               'Cooking level: ' + str(self.cooking_lvl) + '\n' + \
               'Cooking time: ' + str(self.cooking_time) + '\n' + \
               'Ingredients: ' + ' '.join(self.ingredients) + '\n' + \
               'Recipe type: ' + self.recipe_type + '\n' + \
               'Description: ' + self.description
