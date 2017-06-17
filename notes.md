# Story

# User is logged in
  - They are redirect to the users profile page /users/:slug - /users/:id
  - This page includes:
    - A list of parties
      - each party has a link to the parties show page resource :parties, only: [:show, :update]
        - if you click that link you go to /parties/:id - /parties/:slug
        - this page has the option to leave the party PUT /parties/:id params[:leave_party] #-> true
        /parties/:party_id/character/:id
    - A list of characters
    - A link to create a new characters -> resources :characters, except: [:index]
      - if they way to crate new character it takes them to the new character screen characters/new
        - Has a form for characters
