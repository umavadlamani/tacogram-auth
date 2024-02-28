# ENTR-451 Week 8 Practice Exercise – Tacostagram Auth

## Instructions

- Using this repository as a template, create a `tacogram-auth` repo in your GitHub account and open the project in Gitpod
– expected output of this script is `There are 2 new posts.`
- Open the `config/routes.rb` file and note that resources for *posts*, *sessions* and *users* are already set up for you
- Open the `app/controllers` folder and note that controllers for *posts*, *sessions* and *users* already exist

## Goals

### Step 1 - Users

- Secure data in transit: Modify the new user form to obfuscate the password from view
- Secure data at rest: When creating a new user, encrypt the user's password with bcrypt
- __Challenge__: Do not `save` a new user if the user's email is already taken

### Step 2 - Sessions

- Secure data in transit: Modify the new session form to obfuscate the password from view
- In `app/controllers/sessions_controller.rb`, authenticate a user:
  - find user by email.
    - if no user is found: redirect to `/login` with a `flash` message
  - if user exists: authenticate (i.e. check) their password
    - if authentication succeeds: store the user's id in a secure cookie (i.e. `session`)
    - if authentication succeeds: redirect to `/posts` with a `flash` message
    - if authentication fails: redirect to `/login` with a `flash` message
- In `app/controllers/sessions_controller.rb`, logout a user in the `destroy` action
- In `app/controllers/application_controller.rb`, assign `@current_user`
- In `app/views/layouts/application.html.erb`, modify the navbar:
  - conditionally hide the Login and Sign Up links if a user is logged in
  - if user is logged in:
    - hide Login and Sign Up buttons
    - show first name of logged in user
    - show a Logout button

### Step 3 - Posts

- If a user is not logged in, hide the new post form and instead show a message telling the visitor they must login to post
- In `app/controllers/posts_controller.rb`, assign the post's user as the logged in user
- In `app/views/posts/index.html.erb`, display the first name of the user that created each post
- __Challenge__: Do not let a non-logged-in visitor get to the new post form; instead redirect with a flash message

### Extra Challenge

- Try adding comments functionality
  - hint: comments are similar to activities
