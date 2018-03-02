
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

//$('.yoxview').yoxview();	


// Slider  	
	if (jQuery().flexslider) {
	   $('.flexslider').flexslider({
			smoothHeight: false, 
			controlNav: false,           
			directionNav: false, 
			animation: "fade",
		    useCSS: true,
		    keyboard: true,
		    startAt: 0,
			slideshowSpeed: 4000, 
			animationSpeed: 900, 
			prevText: "&larr;",
			nextText: "&rarr;",
			selector: ".slides > .slide"
	    });
	};
    
    
// Smooth scrolling - css-tricks.com


});

//
//	(function() { 
//		Galleria.run('.galleria');
//
//		Galleria.configure({
//			transition: 'fadeslide',
//			transitionSpeed: 800,
//			autoplay: 2500,
//			carouselSpeed: 800,
//			preload: true,
//			imageCrop: true,
//			height: 600,
//			trueFullscreen: true,
//			easing: 'galleriaOut'
//		});
//	}());
//
//(function() { 
//            if (Galleria) { $("body").text('Galleria works') }
//}());
//(function() { 
//    Galleria.loadTheme("galleria/galleria.classic.min.js");
//    Galleria.run('.galleria');
//}());

//(function(){
//	Galleria.configure({
//		transition: 'fadeslide',
//		transitionSpeed: '600',
//		autoplay: 5500,
//		preload: 5,
//		height: 0.5625,
//		height: 800,
//		easing: 'galleriaIn',
//		pauseOnInteraction: false
//	});
//	Galleria.loadTheme('galleria/themes/classic/galleria.classic.js');
//	Galleria.run('.galleria');
//}());