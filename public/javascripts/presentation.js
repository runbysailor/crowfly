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
  var perfectHeight = myHeight-64;  
  $("#content").height(perfectHeight);
  $("#plugin").height(perfectHeight);  
}

// run resize when document loads //
$(document).ready(function(){
  reSize();
});

// run resize when window is resized //
window.onresize = reSize;