$(document).on('turbolinks:load', function(){
  $("a.info").on("mouseover", function(){
    var character = this.parentElement
    $.getJSON(this.href).success(function(json) {
      var name = document.createElement("p");
      var name_node = document.createTextNode(json.name)
      name.appendChild(name_node)
      character.appendChild(name)
      var level = document.createElement("p");
      var level_node = document.createTextNode(", Level " + json.level)
      name.appendChild(level_node)
      character.appendChild(level)
      var secrets = document.createElement("p");
      var secrets_node = document.createTextNode(", " + json.secrets.length + " secrets")
      name.appendChild(secrets_node)
      character.appendChild(secrets)
    })
  })
  $("a.info").on("mouseout", function(){
      var node = this.parentElement
      var p_list = node.getElementsByTagName("p")
      for(var i=p_list.length-1; i>=0; i--) {
        var p = p_list[i];
        p.parentNode.removeChild(p)
      }
  })
})
