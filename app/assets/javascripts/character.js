$(document).on('turbolinks:load', function(){
  $("a.info").on("mouseover", function(){
    $.getJSON(this.href).success(function(json) {
      console.log(json)
    })
  })
  $("a.info").on("mouseout", function(){
      console.log("moused out")
  })
})
