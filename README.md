# Rails Checkpoint

## Instructions
Fork and clone this repository and follow the instructions below. Make at least one commit for each section. When finished, push your commits to your forked repository and submit a Pull Request back to the original repository.

## Section I (Models & Migrations)

  > Note: This repo already contains an empty rails app.

  1. In the terminal run the command to create your database.
  2. Create two models for `Post` and `Comment` where comments are owned by posts.
  3. Database table for `Post` should have two attributes: `content` (string) and `is_published` (boolean) and table for `Comment` should have an attribute `body` (string).
  4. From the command line, run the appropriate `rails` command to generate your schema.
  5. Create two `Post` instances in your seed file, then run your seed file from the command line.

## Section II (Routes, Controllers & Views)

  > Remember to start your Rails server to inspect your application in the browser.

  1. Set up routes and controller actions for the `index`, `show`, `new`, and `create` for the `Post` model only. (Note: only use instance variables `@posts` and `@post` for sending data to the view)
  2. Create views for the `index`, `show` and `new` actions. (Note: `index` and `show` views MUST render the post('s) `content` property, and the `new` view must have a namespaced form field for `content`)


## Test Your Code Early. Test Your Code Often

Before you begin, run the test suite (instructions below) to see all the checks that will be run against your work. Your job is to get the results showing `0 failures`.

Once you think you've satisfied one of the above steps, run the test suite to double-check your work.

To run the tests, first ensure all gems from the Gemfile are installed:
```
bundle install
```

Then call the test runner each time you want to check your code.

For Section I only
```
rspec --format documentation spec/models_migrations_spec.rb
```

For Section II only
```
rspec --format documentation spec/routes_controllers_views_spec.rb
```

Display test results for both sections at Once
```
rspec --format documentation
```