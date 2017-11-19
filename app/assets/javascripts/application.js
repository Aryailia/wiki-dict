// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function apiRequest(url, method, body) {
  return (
    fetch(url, {
      method: method == null ? 'get' : method,
      header: {
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/json'
      },
      body: body == null ? null : JSON.stringify(body)
    }).then(function (response) {
      return (response.json());
    })
  );
}

function ajaxEdit(url, id) {
  apiRequest(url, 'get').then(function (response) {
    var show = document.getElementById('show' + id);
    var edit = document.getElementById('edit' + id);
    show.style.display = 'none';
    edit.style.display = 'block';

    console.log(response);
    document.getElementById('lexeme_headword' + id).value = response.headword;
  });
}

function ajaxUpdate(url, formId) {
  
}