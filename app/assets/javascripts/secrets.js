$(document).on('turbolinks:load', function(){
  $("a.load_secrets").on("click", function(e){
    $.getJSON(this.href).success(function(json) {
      var $ul = $("div.secrets ul")
      $ul.html("")
      json.forEach(function(secret){
        $ul.append("<li>" + secret.content + "</li>")
      })
    })
    e.preventDefault();
  })
})
