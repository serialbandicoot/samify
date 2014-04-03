//= require jquery
//= require jquery-ui

$(function(){
   $( ".js-artist-search" ).autocomplete({
            source: "/artists.json",
            minLength: 3,
            select: function( event, ui ) {
                $(".js-album-search").autocomplete({source: '/artists/'+ui.item.value+'/albums.json',minLength: 0, search: ''})
            }
        });
});