// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function remove_fields(link) {
  alert($(link).up(".fields"));
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}

function is_android() {
    var uagent = navigator.userAgent.toLowerCase();
    if (uagent.search('android') >= 0)
        return true;
    else
        return false;
}

function is_iphone() {
    var uagent = navigator.userAgent.toLowerCase();
    if (uagent.search('iphone') >= 0)
        return true;
    else
        return false;
}


