
(function ($) {
// VERTICALLY ALIGN FUNCTION
$.fn.vAlign = function() {
  return this.each(function(i){
  var ah = $(this).height();
  var ph = $(this).parent().parent().height();
  var mh = (ph - ah) / 2;
  if(mh>0) {
    $(this).css('margin-top', mh);
  } else {
    $(this).css('margin-top', 0);
  }
});
};
})(jQuery);


$(document).ready(function() {



// Slider  	
	if (jQuery().flexslider) {
	   $('.flexslider').flexslider({
			smoothHeight: false, 
			controlNav: false,           
			directionNav: false, 
			animation: "fade",
		    useCSS: true,
		    keyboard: true,
		   	reverse: true,
		    startAt: -1,
		    initDelay: 30,
		    easing: "swing",
			slideshowSpeed: 3500, 
			animationSpeed: 800, 
			prevText: "&larr;",
			nextText: "&rarr;",
			selector: ".slides > .slide"
	    });
	}
    


});
