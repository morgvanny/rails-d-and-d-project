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

    var data = $(this).serialize();

    $.ajax({
       type: "POST",
       url: this.action,
       data: data,
       success: function(response){
         $("#secret_content").val("");
         $ul.append(response)
       }
     });

    e.preventDefault();
  })
})
