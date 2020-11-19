// var
// $card = $('.card'),
// $cardTitle = $('.card-title'),
// $cardSubtitle = $('.card-subtitle'),
// $cardShine = $('.card-shine'),
// $cardShadow = $('.card-shadow'),
// currentMousePos = { x: 0, y: 0 },
// mouseFromCenter = { x: 0, y: 0 };

// $(document).mousemove(function(event) {
//   var
//   wHeight= $(window).height(),
//   wWidth= $(window).width();

//   currentMousePos.x = event.pageX;
//   currentMousePos.y = event.pageY;
//   mouseFromCenter.x = currentMousePos.x - (wWidth / 2);
//   mouseFromCenter.y = currentMousePos.y - (wHeight / 2);

//   var
//   around1 = -1 * (currentMousePos.y * 100 / wHeight * 0.2 - 10) + 'deg',
//   around2 = 1 * (currentMousePos.x * 100 / wWidth * 0.2 - 10) + 'deg',
//   trans1 = (currentMousePos.x * 100 / wHeight * 0.3 ) + 'px',
//   trans2 = (currentMousePos.y * 100 / wHeight * 0.3 ) + 'px',
//   dy = event.pageY - wHeight / 2, //@h/2 = center of poster
//   dx = event.pageX - wWidth / 2, //@w/2 = center of poster
//   theta = Math.atan2(dy, dx), // angle between cursor and center of poster in RAD
//   angle = theta * 180 / Math.PI - 90,
//   mousePositionX = ( currentMousePos.x / wWidth) * 100,
//   mousePositionY = 50+( currentMousePos.y / wHeight)*10;

//   // gradient angle and opacity for card shine effect
//   $cardShine.css('background', 'linear-gradient(' + angle + 'deg, rgba(255,255,255,' + (currentMousePos.y / wHeight) * .7 + ') 0%,rgba(255,255,255, 0) 80%)');
//   // card pos and angle
//   $card.css({
//   "-webkit-transform": "translate3d(" + trans1 + ", " + trans2 +", 0) scale(1) rotatex(" + around1 + ") rotatey(" + around2 + ")",'background-position': mousePositionX + '%' + ' ' + (currentMousePos.y / wHeight) * 50  + '%'
//   });
//   // card shadow pos and angle
//   $cardShadow.css({"transform": "scale(.9,.9) translateX(" + ((mouseFromCenter.x * -0.02) + 12) + "px) translateY(" + ((mouseFromCenter.y * -0.02) + 12 ) + "px) scale(1.0) rotateY(" + (mouseFromCenter.x / 25) * 0.5 + "deg) rotateX(" + ((mouseFromCenter.y / -25) ) + "deg)" });

//   $cardTitle.css({"transform": "translateX(" + ((mouseFromCenter.x / 25) * 0.7) + "px) translateY(" + ((mouseFromCenter.y / 25) * 1.65) + "px)"
//   });

//   $cardSubtitle.css({"transform": "translateX(" + ((mouseFromCenter.x / 25) * 0.5) + "px) translateY(" + ((mouseFromCenter.y / 25) * 1.15) + "px) translateZ(60px)"
//   });
// });
