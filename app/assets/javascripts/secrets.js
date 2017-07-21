function Secret(attributes){
  this.id = attributes.id;
  this.content = attributes.content
}

Secret.templateSource = $("#secret-template").html()
Secret.template = Handlebars.compile(Secret.templateSource)

Secret.prototype.renderLI = function(){
  return Secret.template(this)
}


$(document).on('turbolinks:load', function(){
  var $ul = $("div.secrets ul")
  $("a.load_secrets").on("click", function(e){
    const baseURL = this.href
    $.getJSON(baseURL).success(function(json) {
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
  })

  $("#new_secret").on("submit", function(e){

    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()
    $.post(action, params)
    .success(function(json){
      var secret = new Secret(json);

      secretLi = secret.renderLI()

      $("#secret_content").val("");
      $ul.append(secretLi)
    })
    e.preventDefault();
  })
})
