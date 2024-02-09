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
            - You may need to open a new terminal for this command to be recognized, or use a different shell.
    5. Run `rails s` to start the dev server.


## Conventions
1. Please use snake_case.
2. Please comment with the format '# My comment'
    1. Start with '# '
    2. Include your commnent, capitalized, with no period, unless there's multiple sentences.
3. Leave as many comments on your code as possible!
4. Please follow or update the [dbdiagram](https://dbdiagram.io/d/shiftoverflowed-65c58cdcac844320aec7146c).