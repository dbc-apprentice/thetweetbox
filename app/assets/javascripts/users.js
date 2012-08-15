$(function(){
    // var $container = $('#container');
    //
    // $container.infinitescroll(
    //     {
    //         navSelector  : '#page-nav',
    //         nextSelector : '#page-nav a',
    //         itemSelector : '.box',
    //         animate      : true,
    //         debug        : true
    //     });

});

$(function(){
    $(".tweets a").each(function() {
        var contents = $(this).html();
        $(this).html(contents.replace(/\#([^\s]*)/g, "<span class=\"label\">$1</span>"));
    });
});
