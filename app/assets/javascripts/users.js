// $(function(){
//     // var $container = $('#container');
//     //
//     // $container.infinitescroll(
//     //     {
//     //         navSelector  : '#page-nav',
//     //         nextSelector : '#page-nav a',
//     //         itemSelector : '.box',
//     //         animate      : true,
//     //         debug        : true
//     //     });
// 
// });
// 
// $(function(){
//     $(".tweets a").each(function() {
//         var contents = $(this).html();
//         $(this).html(contents.replace(/\#([^\s]*)/g, "<span class=\"label\">$1</span>"));
//     });
// });

$(function(){
  var $container = $('#container');
  $container.imagesLoaded(function(){
      $container.masonry({
         itemSelector: '.box',
         columnWidth: 100
       });
     });
  
  $container.masonry({
  //    // options...
       itemSelector : '.box',
  //    // columnWidth: 300,
      isAnimated: true
   });
  
  $container.infinitescroll(
    {
      navSelector  : '#page-nav',    // selector for the paged navigation 
      nextSelector : '#page-nav a',  // selector for the NEXT link (to page 2)
      itemSelector : '.box',     // selector for all items you'll retrieve
      animate      : true,
      debug        : true 
    }, 
  
    function( newElements ) {
      var $newElems = $( newElements ).css({ opacity: 0 });
      $newElems.animate({ opacity: 1 });
      $container.masonry( 'appended', $newElems, true );
    }
  );

	    $(".tweets a").each(function() {
	        var contents = $(this).html();
	        $(this).html(contents.replace(/\#([^\s]*)/g, "<span class=\"label\">#$1</span>"));
	    });
  
});
