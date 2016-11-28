// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function getComment(){
    var url = window.location.pathname;
    var id = url.substring(url.lastIndexOf('/') +1);
    $.getJSON("/requests/"+id+"/comments.json", null, function(json) {
        var remove = $('#ice tr').attr(id);
        $('#ice').find('tbody').remove();
       $.each(json, function(i, data){
           $('#ice').append("<tbody><tr><td>"+data.title+"</td><td>"+data.description+"</td><td>"+data.user_id+"</td><td>"+data.request_id+"</td></tr></tbody>");
       });
        // setTimeout(getComment(),10000);
    });
}

$(document).ready(function(){
    getComment();
});