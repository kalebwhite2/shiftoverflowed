# README

## First Time Setup
- Windows
    1. [Install ruby.](https://rubyinstaller.org/downloads/)
        1. Select the bolded version.
        2. Just click next - don't modify any options.
    2. Verify that you have SQLite3 installed by running `sqlite3 --version`. As long as something pops up, you're good. If you don't have SQLite installed, [download it here.](https://www.sqlite.org/index.html).
    3. Navigate to your directory in an administrator-authorized CLI (ie, search 'powershell' in the search bar, right click and click run as an administrator, and the `cd` to the correct directory.)
    4. Run `gem install rails`. Pray. 
        - If it doesn't install correctly, google is your best friend. 
        - If a particularly part of the install is taking suspiciously long, hitting CTRL+C will stop only that particular installation.
        - Once your installation has supposedly completed, run `bundle install` to see if you really have everything.
    5. Run `rails s` to start the dev server.


## Naming Conventions
1. Please use snake_case

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
