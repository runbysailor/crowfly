var ge;
google.load("earth", "1");

function init() {
  if (google.earth.isSupported()) {
    if (google.earth.isInstalled()) {
      google.earth.createInstance('plugin', initCB, failureCB);
    } else {
    alert("You must install the Google Earth Plugin in order to use CrowFly. Please contact us if we can be of assistance.")
    google.earth.createInstance('plugin', initCB, failureCB);
    }
  } else {
    $("#plugin").html("<div id='failure'><br /><br /><br /><h2>Your browser does not support the Google Earth Plugin, which is necessary to run CrowFly.<br />We recommend that you download the latest version of <a href='http://www.google.com/chrome'>Google Chrome</a>.<br />If you require assistance, please contact us anytime at <a href='mailto:hello@crowfly.co'>hello@crowfly.co<a/>!</h2></div>");
  }
}

function failureCB(errorcode) {
  alert("Error: " + errorcode + ". Please refresh your browser. If the issue persists, please contact admin@crowfly.co");
}

google.setOnLoadCallback(init);