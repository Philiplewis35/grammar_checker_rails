//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .
//

$(document).on("turbolinks:load", () => {
  $('.select_services').select2({
    "placeholder": 'Please select from the list of grammar services...',
    "language": {
        "noResults": function(){
            return "Your are using all existing services";
        }
    }
  });
});
