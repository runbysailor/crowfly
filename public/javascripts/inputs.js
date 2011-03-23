function removeImage(obj) {        
  obj.style.backgroundImage="none";
}

function checkValue(obj) {
  var x = obj.value
  if (x==null || x=="") {
    obj.style.backgroundPosition="center center";
    obj.style.backgroundRepeat="no-repeat";
    obj.style.backgroundImage="url('/images/loading.gif')";
    return false;
  }
}

// prevent accidental form submission from enter key //
// TODO: only prevent when $("#search").focus(); //
function submitForm() {
  $("form").submit();
}

$(document).ready(function () {
  $("#point_content").focus(function () {
    $("#point_content").css('color','#333');
    $("#point_content").css('background-color','#FFF');
    $("#point_content").height(245);
  });
  $("#point_content").blur(function () {
    $("#point_content").height(16);
    $("#point_content").css('background-color','#F0F0F0');
    $("#point_content").css('color','#FFF');
  });
});