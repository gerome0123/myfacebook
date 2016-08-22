 $(document).ready(function(){
    $(':button').click(function (event) {
        $("section#post_comments_" + this.id).fadeToggle();
         $('textarea#comment-' + this.id).focus();
        
        
    });
});


$(document).on('click', 'a[href^="#post_comments_"]', function(event) {
  var $target;
  event.preventDefault() && event.stopImmediatePropagation();
  $target = $($(this).attr('href'));
  var box = $target.children('#comments').find('textarea');
  $target.fadeToggle(); 
  box.focus();
});

