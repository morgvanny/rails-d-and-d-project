# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend. - showing secrets on the character show page
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend. - showing 1 secret at a time on the character's secret index page, letting you click next/previous to see the others
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM. -  character has many secrets rendered and appended to the DOM on the user show page (profile page)
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh. - character show page has a form to create new secrets and shows those secrets along with the rest that were already listed above without refreshing
- [x] Translate JSON responses into js model objects. - secrets.js and character.js files have Secret model and Character model which are created from JSON responses
- [x] At least one of the js model objects must have at least one method added by your code to the prototype. - each of them have a method added to the prototype to help render html to append to the DOM

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
