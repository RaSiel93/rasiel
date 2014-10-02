$(document).ready(function(){
  var skin_wrapper = $('#skin-wrapper');
  var skin_name = skin_wrapper.data('skin-name');
  var skin_uri = 'skins/' + skin_name;
  var skin_css_uri = skin_uri + '/' + skin_name + '.css';
  $('head').append('<link rel="stylesheet" href="' + skin_css_uri + '" type="text/css" />');
});
