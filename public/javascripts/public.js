$(document).ready(function(){
  $("#communication").fadeIn(500);
  var t = setTimeout("document.getElementById('message').innerHTML='Please refresh your browser.'", 10000);
});

function proceed() {
  $("#loading").fadeOut(500, function(){
    $("#background").fadeIn(1000, function(){
      $("#wrapper").fadeIn(1000);
    });
  });
}