$(document).on('turbolinks:load', function(){
  $("a.switch").on("click", function(e){
    const URL = this.href
    $.getJSON(URL).success(function(json) {
      var $h3 = $("h3")
      $h3.html("").append(json.content)
      if (json.previous_id === null) {
        $("a#prev").hide()
      } else {
        $("a#prev").show()
        document.getElementById("prev").setAttribute("href", URL.replace(/\/[^\/]*$/, '/' + json.previous_id))
      }
      if (json.next_id === null) {
        $("a#next").hide()
      } else {
        $("a#next").show()
        document.getElementById("next").setAttribute("href", URL.replace(/\/[^\/]*$/, '/' + json.next_id))
      }
    })
    e.preventDefault()
  })
})
