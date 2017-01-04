# Create Student Repo

https://ds100-repo.herokuapp.com/

This little app is used in DS100 to automatically create private repos for
students.

The repos created look like `s0001`, `s0002`, etc.

To deploy another instance of this app:

1. Clone this repo and copy `config/application.yml.sample` into
   `config/application.yml`. Add your Github API token to that file.
2. Run `bundle install`.
3. Run

    ```
    heroku create <app_name>
    git push heroku master
    heroku run rake db:migrate
    figaro heroku:set
    ```
