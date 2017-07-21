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
    }

Secret.show_all = function(e){
    const baseURL = this.href
    $.getJSON(baseURL).done(function(json) {
      var $p = $("div.secrets p")
      $ul.html("")
      $p.html("")
      if (json.length > 0) {
        json.forEach(function(secret){
          $ul.append("<li><a href=\"" + baseURL + "/" + secret.id + "\">" + secret.content + "</a></li>")
        })
      } else {
        $p.append("This character has nothing to hide...yet.")
      }
      $("#new_secret").show();
    })
    e.preventDefault();
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
  
  $("a.load_secrets").on("click", Secret.show_all)
  $("#new_secret").on("submit", Secret.form_submit)
})
