# rails-d-and-d-project
a rails app for organizing characters and parties they are a part of

licenced under GNU GENERAL PUBLIC LICENSE

To run the application, clone the repository, bundle install, rake db:migrate, and if you'd like oauth to work, you'll need to set up a client id and secret in google developer tools. Then put a file in the config folder called application.yml, which should contain the following:

google_client_id: "your google client id"
google_client_secret: "your google client secret"

Then start the server, and go to localhost in your browser, and specify whatever port your server is running on.

If you'd like to contribute to this project, feel free to fork it, make changes, and submit a pull request - or create an issue if you aren't sure how to make the change you want.