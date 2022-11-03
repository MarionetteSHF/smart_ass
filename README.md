# SmartAss Iteration 1

### Team Members

Ziniu Liu - zl3100

Hanfu Shi - hs3239

Wu Wei - ww2614

Lynn Zhu - jz2969

### Project Information

* **Ruby Version:** 3.1.2

* **Heroku:** https://smart-ass-2022.herokuapp.com/

### Instructions and Setup

1. Clone this repo to your development environment

`git clone https://github.com/MarionetteSHF/smart_ass.git`

2. Switch to iteration-1 branch for grading

`git chechout iteration-1`

3. Run `bundle install --without production` to make sure all gems are properly installed

4. Build our initial database schema, and add some seed data

```shell
bundle exec rake db:migrate
bundle exec rake db:test:prepare
bundle exec rake db:seed
```

5. Test the converage

```shell
rake spec
rake cucumber
```
6. Start application
```shell
bundle exec rails s
```
7. Routes
```shell
/items
/items/new
/items/:id
/items/:id/edit
/items/:id/category
/login
/users
```
