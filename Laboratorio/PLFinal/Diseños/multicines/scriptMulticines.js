/*	Table OF Contents
 ==========================
 Carousel
 Ajax Tab
 List view , Grid view  and compact view
 Global Plugins
 Customs Script
 Responsive cat-collapse for homepage,
 INBOX MESSAGE
 */

 var headerHeight = $('.navbar-site').height();
 var wrapper = $('#wrapper');
 
 // Modernizr touch event detect
 function is_touch_device() {
     return 'ontouchstart' in window;
 }
 
 var isTouchDevice = is_touch_device();
 
 $(function () {
     var todayis = moment().format('MM/DD/YYYY');
     $('input[name="date"]').daterangepicker({
             singleDatePicker: true,
             startDate: todayis,
             showDropdowns: true,
             locale: {
                 format: 'MM/DD/YYYY'
             }
         },
         function (start, end, label) {
         });
 });
 
 // Theme Switcher
 
 
 
 $(document).ready(function () {
 
     // check if if it is dark theme or not
     // return boolean true or false
     function isDark() {
         return $("html").attr("theme") == 'dark'
     }
 
     function darkModeToggle() {
         if (isDark()) {
             $("html").attr("theme", "light");
         } else {
             $("html").attr("theme", "dark");
         }
     }
 
     function onClickDark() {
         $('.theme-switcher').on('click', function () {
             darkModeToggle();
             if (isDark()) {
                 $(this).addClass('active')
             } else {
                 $(this).removeClass('active')
             }
         })
     }
 
     onClickDark();
 
     var navbarSite = $('.navbar-site');
 
     // check if RTL or LTR
     var ifrtl = false;
     var dir = $("html").attr("dir");
     var direction = "left";
 
     if (dir == "rtl") {
         ifrtl = true;
         direction = "right";
     } else {
     }
 
     // SET HEADER HEIGHT AS PADDING-TOP to WRAPPER
 
     function setWrapperHeight() {
         wrapper.css('padding-top', headerHeight + 'px');
     }
 
     setWrapperHeight();
 
     // ON SCROLL FADE OUT -_- awesome ?? yah
 
     function fadeOnScroll(target) {
         var target = $('' + target + ''),
             targetHeight = target.outerHeight();
         $(document).scroll(function () {
             var scrollPercent = (targetHeight - window.scrollY) / targetHeight;
             scrollPercent >= 0 && (target.css("background-color", "rgba(0,0,0," + (1.1 - scrollPercent) + ")"))
         });
     }
 
     if (!isTouchDevice) {
         fadeOnScroll('.layer-bg');
     }
 
 
     /*==================================
      Carousel
      ====================================*/
     $('.bg-slider').bxSlider({
         auto: true,
         autoControls: false,
         stopAutoOnClick: true,
         mode: 'fade',
         speed: 800,
         pause: 5000,
         pager: false
     });
 
 
     // Featured Listings  carousel || HOME PAGE
     var owlitem = $(".item-carousel");
 
     owlitem.owlCarousel({
         //navigation : true, // Show next and prev buttons
         navigation: false,
         pagination: true,
         items: 5,
         itemsDesktopSmall: [979, 3],
         itemsTablet: [768, 3],
         itemsTabletSmall: [660, 2],
         itemsMobile: [400, 1]
 
     });
 
     // Custom Navigation Events
     $(".slider-nav").click(function () {
         owlitem.trigger('owl.next');
     });
     $("#prevItem").click(function () {
         owlitem.trigger('owl.prev');
     });
 
 
     // Featured Listings  carousel || HOME PAGE
     var featuredListSlider = $(".featured-list-slider");
 
     featuredListSlider.owlCarousel({
         //navigation : true, // Show next and prev buttons
         navigation: false,
         pagination: false,
         items: 5,
         itemsDesktopSmall: [979, 3],
         itemsTablet: [768, 3],
         itemsTabletSmall: [660, 2],
         itemsMobile: [400, 1]
     });
 
     // Custom Navigation Events
     $(".featured-list-row .next").click(function () {
         featuredListSlider.trigger('owl.next');
     });
 
     $(".featured-list-row .prev").click(function () {
         featuredListSlider.trigger('owl.prev');
     });
 
 
     /*==================================
      List view clickable || CATEGORY
      ====================================*/
 
     // List view , Grid view  and compact view
 
     //  var selector doesn't work on ajax tab category.hhml. This variables elements disable for V1.6
     // var listItem = $('.item-list');
     // var addDescBox = $('.item-list .add-desc-box');
     //  var addsWrapper = $('.adds-wrapper');
 
     $('.list-view,#ajaxTabs li a').click(function (e) { //use a class, since your ID gets mangled
         e.preventDefault();
         $('.grid-view,.compact-view').removeClass("active");
         $('.list-view').addClass("active");
 
         $('.category-list').addClass("make-list").removeClass("make-grid make-compact");
 
         if ($('.adds-wrapper').hasClass('property-list')) {
             $('.item-list .add-desc-box').removeClass("col-md-9").addClass("col-md-6");
         } else {
             $('.item-list .add-desc-box').removeClass("col-md-9").addClass("col-md-7");
         }
 
     });
 
     $('.grid-view').click(function (e) { //use a class, since your ID gets mangled
         e.preventDefault();
         $('.list-view,.compact-view').removeClass("active");
         $(this).addClass("active");
         $('.category-list').addClass("make-grid").removeClass("make-list make-compact");
 
         if ($('.adds-wrapper').hasClass('property-list')) {
             // keep it for future
         } else {
             //
         }
 
     });
 
 
     $('.compact-view').click(function (e) { //use a class, since your ID gets mangled
         e.preventDefault();
         $('.list-view,.grid-view').removeClass("active");
         $(this).addClass("active");
         $('.category-list').addClass("make-compact").removeClass("make-list make-grid");
 
         if ($('.adds-wrapper').hasClass('property-list')) {
             $('.item-list .add-desc-box').addClass("col-md-9").removeClass('col-md-6');
         } else {
             $('.item-list .add-desc-box').addClass("col-md-9").removeClass('col-md-7');
         }
     });
 
     $('.e-grid-view').click(function (e) {
         $(this).addClass("active");
         $('.event-category-list').removeClass('has-list-view');
         $('.e-list-view').removeClass("active");
     });
 
     $('.e-list-view').click(function (e) {
         $(this).addClass("active");
         $('.event-category-list').addClass('has-list-view');
         $('.e-grid-view').removeClass("active");
     });
 
 
     if ($(this).width() < 767) {
         $(".event-category-list .event-item-col").each(function (index, element) {
             var eventFooter = $(this).find('.card-footer');
             var eventInfo = $(this).find('.card-event-info');
             //  $(this).find('.card-body').append(footer);
             $(this).find('.badge.price-tag').clone().insertAfter(eventInfo);
             eventFooter.clone().insertAfter(eventInfo);
         });
     }
 
 
     /*==================================
      Global Plugins ||
      ====================================*/
 
     $('.long-list').hideMaxListItems({
         'max': 8,
         'speed': 500,
         'moreText': 'View More ([COUNT])'
     });
 
 
     $('.long-list-user').hideMaxListItems({
         'max': 12,
         'speed': 500,
         'moreText': 'View More ([COUNT])'
     });
 
     $(function () {
         $('[data-toggle="tooltip"]').tooltip()
     });
 
     $("select.selecter").niceSelect({ // custom scroll select plugin
     });
 
     $(".selectpicker").niceSelect({ // category list Short by
         // customClass: "select-sort-by"
     });
 
     $(".scrollbar").niceScroll();  //  customs scroll plugin
 
     $(".loginForm").validate(); //  form validation
 
 
     // smooth scroll to the ID
     $(document).on('click', 'a.scrollto', function (event) {
         event.preventDefault();
         $('html, body').animate({
             scrollTop: $($.attr(this, 'href')).offset().top
         }, 500);
     });
 
 
     /*=======================================================================================
      cat-collapse Homepage Category Responsive view
      ========================================================================================*/
     // $('.collapse-box .collapse').collapse();
 
     var catCollapse = $('.cat-collapse');
 
     $(window).bind('resize load', function () {
 
         if ($(this).width() < 767) {
             catCollapse.collapse('hide');
             catCollapse.on('show.bs.collapse', function () {
                 $(this).prev('.cat-title').find('.icon-down-open-big').addClass("active-panel");
                 //$(this).prev('.cat-title').find('.icon-down-open-big').toggleClass('icon-down-open-big icon-up-open-big');
             });
 
             catCollapse.on('hide.bs.collapse', function () {
                 $(this).prev('.cat-title').find('.icon-down-open-big').removeClass("active-panel");
             })
 
         } else {
             $('#bd-docs-nav').collapse('show');
             catCollapse.collapse('show');
         }
 
     });
 
 
     // Change Direction based on template dir="RTL"  or dir="LTR"
 
     var sidebarDirection = {};
     var sidebarDirectionClose = {};
 
     if (ifrtl) {
         sidebarDirection = {right: '-251px'};
         sidebarDirectionClose = {right: '0'};
     } else {
         sidebarDirection = {left: '-251px'};
         sidebarDirectionClose = {left: '0'};
     }
 
     $(".filter-toggle").click(function () {
         $('.mobile-filter-sidebar')
             .prepend("<div class='closeFilter'>X</div>")
             .animate(sidebarDirectionClose, 250, "linear", function () {
             });
         $('.menu-overly-mask').addClass('is-visible');
     });
 
     $(".menu-overly-mask").click(function () {
         $(".mobile-filter-sidebar").animate(sidebarDirection, 250, "linear", function () {
         });
         $('.menu-overly-mask').removeClass('is-visible');
     });
 
 
     $(document).on('click', '.closeFilter, .cerrarFiltro', function () {
         $(".mobile-filter-sidebar").animate(sidebarDirection, 250, "linear", function () {
         });
         $('.menu-overly-mask').removeClass('is-visible');
     });
 
     // dropdown selected text
     $(function () {
         $('.selected-dropdown-menu li').click(function () {
             $('.selected-dropdown-menu li a').removeClass('active');
             $(this).find('a').addClass('active');
             var selectedText = $(this).find('a').text();
             $(this).closest('div').find('.selected-dropdown-toggle').text(selectedText);
         });
     });
 
 
 }); // end Ready
 
 
 
 