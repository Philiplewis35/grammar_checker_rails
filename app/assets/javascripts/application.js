//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .
//

$(document).on("turbolinks:load", () => {
  $('.select_services').select2({
    "language": {
        "noResults": function(){
            return "Your are using all existing services";
        }
    }
  });
});
