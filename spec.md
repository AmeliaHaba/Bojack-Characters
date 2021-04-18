# Specifications for the Sinatra Assessment

Specs:
- [X] Use Sinatra to build the app
     -Built app with Sinatra and corneal gem
- [X] Use ActiveRecord for storing information in a database
     -Used active record to create tables for each model class created
- [X] Include more than one model class (e.g. User, Post, Category) 
     -Created User, Character 
- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
     -A user has many characters
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
     -Characters belong to a user
- [X] Include user accounts with unique login attribute (username or email)
     -all users have a unique username
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    -User can create their collection of Bojack Horseman Characters, look at their collection, update a character(s), and delete a character(s)
- [X] Ensure that users can't modify content created by other users
    -User can only see their list and modify their own list
- [X] Include user input validations
    -User can sign-up and login with their username and password
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm
- [X] You have a large number of small Git commits 
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message