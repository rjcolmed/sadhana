# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) => e.g. A teacher has many lessons
- [ ] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) => e.g. A lesson belongs to a teacher
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) => e.g. A tag has many lessons though lesson_tags. 
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) => Teachers may create tags when they create/edit lessons
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) => e.g. a Lesson can't be created without a title
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) => implemented with Tag.most_popular. viewable at tags/most_popular
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) => e.g. teachers/3/lessons/new, Tag
- [x] Include signup (how e.g. Devise) => I implemented my own
- [x] Include login (how e.g. Devise) => I implemented my own
- [x] Include logout (how e.g. Devise) => I implemented my own
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) => Facebook via Omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) => e.g. teachers/3/lessons or students/2/lessons
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) => e.g. teachers/3/lessons/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)=> My login, signup (for teachers and students), and new/edit lesson forms display validation errors

Confirm:
- [x] The application is pretty DRY => Hopefully! I used helpers and created new controllers (to handle specific actions, like a student enrolling in a lesson)
- [x] Limited logic in controllers => see above
- [x] Views use helper methods if appropriate => I have sessions and application helper methods
- [x] Views use partials if appropriate => I used partials for most of the forms and rendering of each data representation, i.e. teachers, students, tags, when possible