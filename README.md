# README

## GIT
1. References:
    - gitref.org
    - git-scm.com
    - git-scm.com/book/en/v2
2. Config:
    - git config --global user.name "myname"
    - git config --global user.email "youremail@email.com"
    - display config: git config --list
3. Command:
    - undo changes: git checkout -f
4. Create new branch and checkout:
    - git checkout -b create-users

## Rails
1. Server:
    - `rails s` / `rails Server`
2. Migration:
    - `rails generate migration create_articles`
    - `rails generate migration add_description_to_articles`
    - `rails generate migration create_users`
    - `rails generate migration add_user_id_to_articles`
3. Rollback:
    - back 1 step: `rake db:rollback`
    - back n step: `rake db:rollback STEP=n`
3. Model:
    - filename: `article.rb`
    - class: `article`
    - by creating Model, rails magicly create getter and setter for each attrb in the table
4. Console:
    - start: `rails console`
    - rails console gives us direct access to database
    - test connection to article table: `Article.all`
    - reload the console(if there're changing in ruby files): `reload!`
    - ask if there is any error when commit the query: `article.errors.any?` 
        - return true/false
        - article = Article.new
        - get full message: `article.errors.full_messages`
5. Query on rails console:
    - DESC table: `Article`
    - SELECT all: `Article.all`
    - SELECT by id: `Article.find(id)`
    - WHERE: `Article.where(:user_id =>nil)
    - INSERT to table:
        1. using `.new`
            1. `article = Article.new`
            2. `article.title = "This is my first article"`
            3. `article.description = "This is description"`
            4. `article.save`
        2. using `.new` (short way):
            1. `article = Article.new(title: "Second article", description: "2nd desc")`
            2. `article.save`
        3. using `.create`: directly create and commit(.save) query
            1. `Article.create(title: "Third article", description: "3rd desc")`
        4. association insert:
            1. user = User.find(8)
            2. article = user.articles.build(title:"xxx", description: "xxx")
            3. article.save
    - SELECT 1st, 2nd ... nth element:
        - `Article.first`
        - `Article.second`
        - `Article.third`
        - `Article.fourth` and so on
    - UPDATE:
        - `article = Article.find(1)`
        - `article.title = "edit article 1"`
        - `article.save`
    - DELETE:
        - article = Article.find(4)
        - `article.destroy`
        - or
        - `Article.find(4).destroy`
6. Association
    - article = Article.new(title:"this is an article",
                            description: "new article desc",
                            user: User.first)
    - NOTE:
        - if using ==> user: User.first (object)
        - if using ==> user_id : 15 (integer)

## Debugging

### Byebug Gem
by using `byebug` gem installed then we can use it to debug our application simply by:
1. put `debugger` in any line of code you want to debug
2. if there is an error then the server will stop running and enter debugger console
3. useful command to debug:
    - `article_params` check parameter sent
    - `n`: go to next line

### In html
type `<%= debug(params) if Rails.env.development? %>`

## Heroku
Heroku doesn't support sqlite3 so move sqlite3 gem to development. Add `pg` and `rails_12factor` gem to production.
Then execute `bundle install --without production`
1. Installation:
    - https://devcenter.heroku.com/articles/heroku-command-line
2. Login:
    - `heroku login`
3. Deploy:
    - `git push heroku yourbranch:master`
4. Rename:
    - `heroku rename newname`
5. Add table:
    - `heroku run rake db:migrate`

## Login
1. Add `has_secure_password` to User Model
2. Add gem `bycrypt` to Gemfile
3. Add `password_digest` (name ==> MUST be exact) attribute to users table 


## Bootstrap Sass
### Installation
1. source: https://github.com/twbs/bootstrap-sass
2. copy into Gemfile (should be before sass-rails)
```sh
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'sass-rails', '~> 5.0'
```
3. bundle install --without production
4. create `custom.css.scss` in `app/assets/stylesheets`
5. copy into `custom.css.scss`
```sh
@import "bootstrap-sprockets";
@import "bootstrap";
```
6. copy into `application.js` in `app/assets/javascripts` (right after jquery_ujs)
```sh
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
```

### Notes:
To add custom css you have to add it in `custom.css.scss` above
1. @import "bootstrap-sprockets";
2. @import "bootstrap";


## Validation Active Records
source: [Active record validation](http://guides.rubyonrails.org/active_record_validations.html)
Regex Tools: [Regex](http://rubular.com)
### User Validations
1. Username must be present and unique
    ```sh
    validates :username, presence: true,
                uniqueness: { case_sensitive: false }
                length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\[a-z]+\z/i
    validates :email, presence: true,
                uniqueness: { case_sensitive: false }
                length: { maximum: 105 },
                format: { with: VALID_EMAIL_REGEX }
    ```
2. Email must be present and unique
3. Validate email format using regex

## Before action
`before_action` works in order

## Others
1. Mockup/wireframing tools:
    - balsamiq.com
2. Gem repository:
    - rubygems.org