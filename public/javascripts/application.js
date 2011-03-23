// define automatic resize //
function reSize() {
  var myWidth = 0, myHeight = 0;
  if( typeof( window.innerWidth ) == 'number' ) {
    // for browsers other than IE //
    myWidth = window.innerWidth;
    myHeight = window.innerHeight;
  } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
    // for IE 6+ in standards compliant mode //
    myWidth = document.documentElement.clientWidth;
    myHeight = document.documentElement.clientHeight;
  } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
    // for IE 4 //
    myWidth = document.body.clientWidth;
    myHeight = document.body.clientHeight;
  }
  var panelHeight = myHeight-64;
  var rightPanelWidth = myWidth-379;
  $("#content").height(panelHeight);
  $("#left-panel").height(panelHeight); 
  $("#right-panel").height(panelHeight);
  $("#right-panel").width(rightPanelWidth);
}

// run resize when document loads //
$(document).ready(function(){
  reSize();
});

// run resize when window is resized //
window.onresize = reSize;

// remove tips when window is scrolled //
$(document).ready(function(){  
  $("#tip").one('mouseover', function () {
    $("#tip").effect("drop");  
  });
});

// make notice bar visible //
function displayNotice() {
  $("#notice").slideDown(500);
  $(".close").fadeIn(100);
  var t = setTimeout('hideNotice()', 5000);
}

// close notice bar //
function hideNotice() {
  $(".close").fadeOut(100);
  $("#notice").slideUp(1000);
}

// empty email field //
$(document).ready(function(){
  $("#prospect_email").focus(function(){
    $("#prospect_email").val('');
  });  
  $("#prospect_email").blur(function(){
    $("#new_prospect").fadeOut(500, function(){
      $("#new_prospect").submit();
    });
  });
});

// display warning for company name //
$(document).ready(function(){
  $("#user_company_name").focus(function(){
    $("#warning").slideDown(500);
  });  
  $("#user_company_name").blur(function(){
    $("#warning").slideUp(500);    
  });
});

// display warning before linking file //
$(document).ready(function(){
  $("#geofile_link").focus(function(){
    $("#warning").slideDown(500);
  });  
  $("#geofile_link").blur(function(){
    $("#warning").slideUp(500);    
  });
});