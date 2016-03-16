!function($){$.fn.scrollTo=function(elem){return $(this).scrollTop($(this).scrollTop()-$(this).offset().top+$(elem).offset().top),this},$.fn.dropdown=function(option){var defaults={inDuration:300,outDuration:225,constrain_width:!0,hover:!1,gutter:0,belowOrigin:!1,alignment:"left"};this.each(function(){function updateOptions(){void 0!==origin.data("induration")&&(options.inDuration=origin.data("inDuration")),void 0!==origin.data("outduration")&&(options.outDuration=origin.data("outDuration")),void 0!==origin.data("constrainwidth")&&(options.constrain_width=origin.data("constrainwidth")),void 0!==origin.data("hover")&&(options.hover=origin.data("hover")),void 0!==origin.data("gutter")&&(options.gutter=origin.data("gutter")),void 0!==origin.data("beloworigin")&&(options.belowOrigin=origin.data("beloworigin")),void 0!==origin.data("alignment")&&(options.alignment=origin.data("alignment"))}function placeDropdown(eventType){"focus"===eventType&&(isFocused=!0),updateOptions(),activates.addClass("active"),origin.addClass("active"),options.constrain_width===!0?activates.css("width",origin.outerWidth()):activates.css("white-space","nowrap");var gutterSpacing,windowHeight=window.innerHeight,originHeight=origin.innerHeight(),offsetLeft=origin.offset().left,offsetTop=origin.offset().top-$(window).scrollTop(),currAlignment=options.alignment,verticalOffset=0;if(options.belowOrigin===!0&&(verticalOffset=originHeight),offsetLeft+activates.innerWidth()>$(window).width()?currAlignment="right":offsetLeft-activates.innerWidth()+origin.innerWidth()<0&&(currAlignment="left"),offsetTop+activates.innerHeight()>windowHeight)if(offsetTop+originHeight-activates.innerHeight()<0){var adjustedHeight=windowHeight-offsetTop-verticalOffset;activates.css("max-height",adjustedHeight)}else verticalOffset||(verticalOffset+=originHeight),verticalOffset-=activates.innerHeight();if("left"===currAlignment)gutterSpacing=options.gutter,leftPosition=origin.position().left+gutterSpacing;else if("right"===currAlignment){var offsetRight=origin.position().left+origin.outerWidth()-activates.outerWidth();gutterSpacing=-options.gutter,leftPosition=offsetRight+gutterSpacing}activates.css({position:"absolute",top:origin.position().top+verticalOffset,left:leftPosition}),activates.stop(!0,!0).css("opacity",0).slideDown({queue:!1,duration:options.inDuration,easing:"easeOutCubic",complete:function(){$(this).css("height","")}}).animate({opacity:1},{queue:!1,duration:options.inDuration,easing:"easeOutSine"})}function hideDropdown(){isFocused=!1,activates.fadeOut(options.outDuration),activates.removeClass("active"),origin.removeClass("active"),setTimeout(function(){activates.css("max-height","")},options.outDuration)}var origin=$(this),options=$.extend({},defaults,option),isFocused=!1,activates=$("#"+origin.attr("data-activates"));if(updateOptions(),origin.after(activates),options.hover){var open=!1;origin.unbind("click."+origin.attr("id")),origin.on("mouseenter",function(e){open===!1&&(placeDropdown(),open=!0)}),origin.on("mouseleave",function(e){var toEl=e.toElement||e.relatedTarget;$(toEl).closest(".dropdown-content").is(activates)||(activates.stop(!0,!0),hideDropdown(),open=!1)}),activates.on("mouseleave",function(e){var toEl=e.toElement||e.relatedTarget;$(toEl).closest(".dropdown-button").is(origin)||(activates.stop(!0,!0),hideDropdown(),open=!1)})}else origin.unbind("click."+origin.attr("id")),origin.bind("click."+origin.attr("id"),function(e){isFocused||(origin[0]!=e.currentTarget||origin.hasClass("active")||0!==$(e.target).closest(".dropdown-content").length?origin.hasClass("active")&&(hideDropdown(),$(document).unbind("click."+activates.attr("id")+" touchstart."+activates.attr("id"))):(e.preventDefault(),placeDropdown("click")),activates.hasClass("active")&&$(document).bind("click."+activates.attr("id")+" touchstart."+activates.attr("id"),function(e){activates.is(e.target)||origin.is(e.target)||origin.find(e.target).length||(hideDropdown(),$(document).unbind("click."+activates.attr("id")+" touchstart."+activates.attr("id")))}))});origin.on("open",function(e,eventType){placeDropdown(eventType)}),origin.on("close",hideDropdown)})},$(document).ready(function(){$(".dropdown-button").dropdown()})}(jQuery);