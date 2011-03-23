function toggleBasics(obj) {
  if (obj.style.color==="black") {
    $("#form-basics").slideUp(500, adjustHeight(-82));
    obj.style.color="gray";
  } else { 
    $("#form-basics").slideDown(500, adjustHeight(+82));
    obj.style.color="black";
  }
}

function toggleOptions(obj) {
  if (obj.style.color==="black") {
    $("#form-options").slideUp(500, adjustHeight(-371));
    obj.style.color="gray";
  } else { 
    $("#form-options").slideDown(500, adjustHeight(+371));
    $("content").height()+20;
    obj.style.color="black";
  }
}

function toggleLogo(obj) {
  if (obj.style.color==="black") {
    $("#form-logo").slideUp(500, adjustHeight(-80));
    obj.style.color="gray";
  } else { 
    $("#form-logo").slideDown(500, adjustHeight(+80));
    obj.style.color="black";
  }
}

function adjustHeight(val) {
  var currentHeight = $("#content").height();
  $("#content").height(currentHeight+val);
  $("#right-panel").height(currentHeight+val);
  $("#left-panel").height(currentHeight+val);
}

$(document).ready(function() {
  var t = setTimeout("toggleBasics(document.getElementById('basics_link'))", 100);
});