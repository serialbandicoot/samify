// This will find any form on the page with a spinner, and when it is submitted it'll show the spinner, and then remove
// on completion

$(function(){

  $('.js_ajax_form').each(function(i,e){

    console.warn(e);

    var $e = $('#search_form');

    var $spinner = $e.find('img.spinner');

    $e.bind("ajax:beforeSend", function(){ console.warn("foo"); $spinner.show(); })
      .bind("ajax:complete",   function(){ console.warn("bar"); $spinner.hide(); });

  });
//
//  $('.js_ajax_form').bind("ajax:beforeSend", function(e){ $(e.parentElement).find('img.spinner').hide() }))
//                    .bind("ajax:complete", function(e){   $(e.parentElement).find('img.spinner').hide() })
//
//
//
//   var expensiveOperation = function(){
//     var r = 1000 * 1000;
//
//     expensiveOperation = function(){ return r };
//     return r;
//   };

});


