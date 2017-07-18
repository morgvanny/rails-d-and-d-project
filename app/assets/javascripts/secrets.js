$(document).on('turbolinks:load', function(){
  $("a.load_secrets").on("click", function(e){
    const baseURL = this.href
    $.getJSON(baseURL).success(function(json) {
      var $ul = $("div.secrets ul")
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
    })
    e.preventDefault();
  })
})
