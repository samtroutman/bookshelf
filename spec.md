Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    Users have many reviews, books have many reviews, and genres have many books
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Reviews belong to books and users, books belong to genres
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Books have many users through reviews, users have many books through reviews
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Books have many users through reviews, users have many books through reviews
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    Reviews have a title and content
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Validates presence, uniqueness of attributes 
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Scope to order by rating
- [X] Include signup
- [X] Include login
- [X] Include logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
    Google signin
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [X] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate