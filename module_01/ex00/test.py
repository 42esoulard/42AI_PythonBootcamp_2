from recipe import Recipe
from book import Book


print(' --- Creating a new book --- ')
book = Book("Recipes Book")
print(' --- Printing book info --- ')
print(book.name)
print(book.creation_date)
print(book.last_update)

print('\n --- Searching empty book --- ')
book.get_recipe_by_name("I don't exist")
book.get_recipes_by_types("I don't exist")
book.get_recipes_by_types("lunch")

print('\n --- Creating a "tourte" recipe with proper arguments --- ')
tourte = Recipe('tourte', 3, 20, ["leek", "puff pastry"],
                "lunch", "tourtitourtitou")

print('\n --- Printing recipe "tourte" str output --- ')
print(str(tourte))

print('\n --- Adding bad non recipe "flutiot" to book --- ')
book.add_recipe("flutiot")

print('\n --- Adding recipe "tourte" to book --- ')
book.add_recipe(tourte)

print(' --- Printing book last update --- ')
print(book.last_update)

print('\n --- Searching recipes by type "lunch" --- ')
book.get_recipes_by_types("lunch")

print('\n --- Searching recipe "tourte" in book --- ')
book.get_recipe_by_name("tourte")

print('\n --- Creating a "patates" recipe with proper arguments --- ')
patates = Recipe('patates', 3, 20, ["potatoe", "more potatoes",
                 "salt"], "lunch", "POTAT")

print('\n --- Adding recipe "patates" to book --- ')
book.add_recipe(patates)

print('\n --- Searching recipes by type "lunch" --- ')
book.get_recipes_by_types("lunch")

print('\n --- Searching recipes by name "patates" --- ')
book.get_recipe_by_name("patates")

print('\n --- Creating a recipe with improper arguments --- ')
tourte = Recipe('bla', '3', 12, [1, "bla"], "starter")
