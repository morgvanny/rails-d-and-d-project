function Character(attributes){
  this.name = attributes.name;
  this.level = attributes.level;
  this.secrets = attributes.secrets.length;
}

Character.prototype.renderP = function(){
  return Character.template(this)
}

Character.details = function(json) {
      var character = new Character(json);
      characterP = character.renderP()
      $(link.nextElementSibling).append(characterP)
    }

$(document).on('turbolinks:load', function(){

  if (Character.templateSource = $("#character-template").html()){
    Character.template = Handlebars.compile(Character.templateSource)
  }
  
  
  $("a.info").on("mouseover", function(){
    link = this
    $.getJSON(this.href).done(Character.details)
  })
  $("a.info").on("mouseout", function(){
    $(".details").html("")
  })
})
