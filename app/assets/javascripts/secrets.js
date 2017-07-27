var $ul

function Secret(attributes){
  this.id = attributes.id;
  this.content = attributes.content
}

Secret.prototype.renderLI = function(){
  return Secret.template(this)
}

Secret.show = function(json){
  var secret = new Secret(json);
  secretLi = secret.renderLI()
  $ul.append(secretLi)
  $(`#delete_secret_${secret.id}`).on("click", Secret.delete)
}

Secret.delete = function(e) {
  e.preventDefault();
  $.ajax({
    url: this.dataset.url,
    type: 'DELETE',
    done: function(result) {
       console.log('I made it')
    }
  });
}

Secret.load = function(e){
    const baseURL = this.href
    $.getJSON(baseURL).done(Secret.show_all)
    e.preventDefault();
  }

Secret.show_all = function(json) {
  var $p = $("div.secrets p")
  $ul.html("")
  $p.html("")
  if (json.length > 0) {
    json.forEach(Secret.show)
  } else {
    $p.append("This character has nothing to hide...yet.")
  }
  $("#new_secret").show();
}

Secret.form_submit = function(e){
    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()
    $.post(action, params)
    .done(Secret.show).done($("#secret_content").val(""))
    e.preventDefault();
  }

$(document).on('turbolinks:load', function(){

  if (Secret.templateSource = $("#secret-template").html()){
    Secret.template = Handlebars.compile(Secret.templateSource)
  }

  $ul = $("div.secrets ul")
  
  $("a.load_secrets").on("click", Secret.load)
  $("#new_secret").on("submit", Secret.form_submit)
})
