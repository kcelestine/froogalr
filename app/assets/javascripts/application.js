// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(40.7484,-73.9857),
    zoom: 14
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
}
  google.maps.event.addDomListener(window, 'load', initialize);

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  document.body.appendChild(script);
}

function unfavorite() {
  var unfavoriteButton = $('#favorite-button').val('Unfavorite').attr('id', 'unfavorite-button');

}
unfavorite();
