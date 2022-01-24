from recipe import Recipe
import datetime


class Book:

    def __init__(self, name):
        self.name = name
        self.creation_date = datetime.datetime.utcnow()
        self.last_update = self.creation_date
        self.recipes_list = {"starter": [],
                             "lunch": [],
                             "dessert": []}

    def get_recipe_by_name(self, name):
        """Prints a recipe with its name and returns the instance"""
        for key, val in self.recipes_list.items():
            for recipe in val:
                if recipe.name == name:
                    print(str(recipe))
                    return recipe
        print('Recipe not found')

    def get_recipes_by_types(self, recipe_type):
        """Get all recipe names for a given recipe_type """
        if recipe_type not in self.recipes_list:
            print('Recipe type not found')
            return
        for recipe in self.recipes_list[recipe_type]:
            print(recipe.name)

    def add_recipe(self, recipe):
        """Add a recipe to the book and update last_update"""
        if not isinstance(recipe, Recipe):
            print('ERROR: not a Recipe type: can\'t add it!')
            return

        self.recipes_list[recipe.recipe_type].append(recipe)
        self.last_update = datetime.datetime.utcnow()
