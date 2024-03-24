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
1. Please comment with the format '# My comment'
  - Start with '# '
  - Include your commnent, capitalized, with no period, unless there's multiple sentences.
1. Leave as many comments on your code as possible!
1. Please use two spaces as your tab size. On VSCode, you can change this by hitting the gear symbol > Settings > Workspace > Workspace: Tab Size. 
  - Also, turn Detect Indentation off. 
1. Please commit often, especially after working on a small, discrete piece of code.
  - Write commit messages as though they began with "In this commit, I will" 'your commit message'. Write your commit message, just don't include the "In this commit, I will" part.
  - Capitalize the first letter of your commit message, and don't end the sentence with a period.
1. Please follow or update the [dbdiagram](https://dbdiagram.io/d/shiftoverflowed-65c58cdcac844320aec7146c).