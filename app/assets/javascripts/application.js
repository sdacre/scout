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
//= require jquery-ui
//= require jquery-ui/widgets/autocomplete
//= require jquery_ujs
//= require jquery.raty
//= require places
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
   $( '.item:first' ).addClass( 'active');
});

$(document).ready(function(){
  $(".reviews").each(function(){
    var This = $(this) ;
    var Nums = This.find(".panel").size() ;
    This.find(".panel:first").addClass("PanelAct");
    This.append("<div class='control'></div>") ;
    This.find(".panel").not(".PanelAct")
      .css("left","100%")
    for ( i=0 ; i<Nums ; i++) {
      This.find(".control").append("<span></span>") ;
    }
    This.find(".control span:eq(0)").addClass("ContActive");
    
    This.find(".control span").click(Reviews);
    
    function Reviews(){
      var loc = $(this).index();
      var ActivLoc = This.find(".ContActive").index();

      $(this).addClass("ContActive")
        .siblings().removeAttr("class");
      
      if ( loc > ActivLoc ) {
        var Dire = '100%'
        var IDire = '-100%'
      }
      if ( loc < ActivLoc ) {
        var Dire = '-100%'
        var IDire = '100%'
      }

      This.find(".panel").not(".PanelAct")
      .css("left",Dire) ;
      This.find(".panel:eq("+loc+")")
      .animate({'left':'0'},speed)
      .addClass("PanelAct")
      .siblings(".PanelAct")
      .removeClass("PanelAct")
      .animate({'left':IDire},speed);
    }
  });
});
  