//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .

$(document).ready(function() {
    $('.select_services').select2();
    if($('.home_page')[0]) {
      send_services_to_chrome_extension_2(1)
    }
});

function send_services_to_chrome_extension(user_id) {
  $.get("/users/" + user_id + "/services", {}, function(response) {
    window.postMessage({type: 'FROM_PAGE', user_id: 1, services: response}, "*")
    console.log('test')
  })
}

function send_services_to_chrome_extension_2(user_id) {
  $.get("/users/" + user_id + "/services", {}, function(response) {
    chrome.runtime.sendMessage('dlmbcmlonnpdjankmfbpifocdhdeghec', {services: response}, console.log('done'));
  })
}
