'use strict';
(function($){
  var rtime,
      timeout = false,
      delta = 200,
      $window = $(window),
      $windowWidth = $window.width();

  function resizeend() {
    if (new Date() - rtime < delta) {
        setTimeout(resizeend, delta);
    } else {
        timeout = false;
        $windowWidth = $window.width();
        $(document).trigger('coffeeResizeEnd');
    }
  }

  $window.on('resize', function () {
      rtime = new Date();
      if (timeout === false) {
          timeout = true;
          setTimeout(resizeend, delta);
      }
  });

  /*---- HOMEPAGE RESERVATION FORM HEIGHT CALCULATION ----*/
  function reservFormImgHeight(){
    if($windowWidth > 992){
      var reservationFormHeight = $('.reservation-form form').innerHeight();
      $('.reservation-form .imgLiquid').css('height', reservationFormHeight);
    }
  }

  /*----- BLOG IMG HEIGHT CALCULATION ------*/
  function blogImgHeightCalc() {
    if($windowWidth > 976){
      $('.blog-item').each(function(){
        var blogItemHeight = $(this).outerHeight();
        $(this).find('.blog-img').css('height', blogItemHeight);
      });
    }
  }
  /* ------------ gallery hover dir ---------*/
  function directionHovereffect(){ 
    if ($windowWidth >= 991){
      if($('.directionhover'). length){
        $('.directionhover  a').hoverdir({
          speed: 400,
          easing: 'ease-in-out'
        });
      }  
    } 
  }

	reservFormImgHeight();
	blogImgHeightCalc();
  directionHovereffect();
  //hovernavbar();

	$window.on('coffeeResizeEnd', function(){
		reservFormImgHeight();
		blogImgHeightCalc();
    directionHovereffect();
	});


	/*-------- IMGLIQUID ----------*/
	$('.imgLiquidFill').imgLiquid();

	/*-------- HOMEPAGE STORE PRODUCTS ------*/
  $('.categories  li button').on('click' , function() {
    var el = $(this);
    el.parents('.categories').find('button').removeClass('selected');
    el.addClass('selected');
  });
	var storeProduct = $('.store-product-list');
	storeProduct.isotope({
	  itemSelector: '.grid-item'
	});
	$('.categories  li button').on('click', function(e) {
      e.preventDefault();
      var filterValue = $(this).attr('data-filter');
      storeProduct.isotope({
          filter: filterValue
      });
  });

	/*------- Homepage Testimonial carousel ---------*/
	var owl = $('.testimonial-owl');
  if(owl.length){
    owl.owlCarousel({
        itemsCustom : [
          [0, 1],
          [991, 2]
        ],
        autoPlay: 4000,
        stopOnHover: true
    });
  }

  /*---------- home page event---------------*/
  var eventOwl = $('#event-owl');
  if(eventOwl.length){
    eventOwl.owlCarousel({
      items: 5,
      singleItem: true,
      addClassActive : true,
      autoPlay:true,
      afterMove: function(){
        eventOwl.find('.owl-item .event-timer').countdown('stop');
        eventOwl.find('.owl-item.active .event-timer').countdown('start');
      }
    });
  }
  
  /*------------ SLIMSCROLL -------------*/
  var pricingCarte = $('.pricing-carte');
  if(pricingCarte.length){
    pricingCarte.slimScroll({
        height: '100%',
        color: '#dc8068',
        allowPageScroll: true
    });
  }

  /*------------------- Google Map -------------------*/
    function initialize() {
      var mapOptions = {
        zoom: 8,
        scrollwheel: false,
        disableDefaultUI: true,
        center: new google.maps.LatLng(-34.397, 150.644),
        styles: [
          {'stylers': [{ 'saturation': -100 }]},
          {
            'featureType': 'road',
            'elementType': 'labels',
            'stylers': [{'visibility': 'off'}]
          },
          {
            'featureType': 'road',
            'elementType': 'geometry',
            'stylers': [{'lightness': 100},
              {'visibility': 'simplified'}]
          }
        ]
      };
      var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      var image = 'images/map-marker.png';
      var myLatLng = new google.maps.LatLng(-34.397, 150.644);
      new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image
       });
    }
  if($('#map-canvas').length !== 0){
  	google.maps.event.addDomListener(window, 'load', initialize);
  }

  
  /* ------------ masonary --------------*/

    var $containergallery = $('#masonry-layout');
    if($containergallery.length){

        var $boxes = $('.grid-item');
        var masonaryOptionsGallery = {
                                isAnimated: true,
                                isFitWidth: true,
                                gutter: '.gutter'
                            };
        $boxes.hide();

        $containergallery.imagesLoaded( function() {
            $boxes.fadeIn();
    
            $containergallery.masonry(masonaryOptionsGallery);    
        });
    
        $window.on('coffeeResizeEnd', function () {
            $containergallery.masonry(masonaryOptionsGallery);
        });

        $containergallery.one( 'layoutComplete', function() {
            $('#galleryLoader').hide();
        });
    }

    /*--------------- Cart Features  ------------------*/

    var $cartitems = JSON.parse(sessionStorage.getItem('cartItems')) || [],
        $cartquantity = $cartitems.length,
        $cartTotal = 0;

    function getCartLength(){
        $cartquantity = $cartitems.length;
        $('.cartitems').html($cartquantity);
    }

    function updateSession(){
        getCartLength();
        sessionStorage.setItem('cartQuantity', $cartquantity);
        sessionStorage.setItem('cartItems', JSON.stringify($cartitems));
    }

    function addToCart(data){
        if(!data){
            return;
        }
        var check = true;

        for(var i = 0; i < $cartquantity; i++){
            if(data.id === $cartitems[i].id){
                check = false;
                $cartitems[i].quantity = $cartitems[i].quantity + 1;
                break;
            }
        }

        if(check){
            $cartitems.push(data);
            getCartLength();

            $('.cartitems').html($cartquantity);
        }

        updateSession();
    }

    function removeProduct(id, that){
        for(var i = 0; i < $cartquantity; i++){
            if(id === $cartitems[i].id){
                $cartitems.splice(i, 1);
                break;
            }
        }

        that.parents('li').slideToggle().remove();
        getCartLength();
        updateTotal();
        updateSession();
        if($cartquantity === 0){
            updatehtml();
        }
    }

    function updateTotal(){
        //Dont total if page does not have carttotal
        if($('#carttotal').length){
            $cartTotal = 0;
            for(var i = 0; i < $cartquantity; i++){
                $cartTotal += ($cartitems[i].price * $cartitems[i].quantity);
            }
            $('#carttotal').html('$ ' + $cartTotal);
        }
    }

    function updatehtml(){
        var html = '';
       if($('#cartItemsType2').length){
            for(var i = 0; i < $cartquantity; i++){
                html += updatetpl($cartitems[i].image, $cartitems[i].name, $cartitems[i].price, $cartitems[i].quantity, $cartitems[i].id, 2);
            }
            if(html === ''){
                html = '<div class="clearfix">' +
                        '<div class="big-content">' +
                          '<div class="product-cart-wrap">' +
                            '<h5>Sorry, you do not have any product in cart.</h5>' +
                          '</div></div></div>';
            }
            $('#cartItemsType2').html(html);
        }
    }

    function updatetpl(image, name, price, quantity, id, type){
        var option = '';
        for(var i = 1; i < 5; i++){
            option += '<option value="' + i + '"' + ((quantity === i) ? 'selected' : '') + '>' + i + ' product</option>';
        }
        if(type === 1){
            return '<div class="clearfix">' +
                        '<div class="big-content">' +
                          '<div class="product-cart-wrap">' +
                            '<figure>' +
                              '<img src="' + image + '" alt="image">' +
                            '</figure>  ' +
                            '<h5>' + name + '</h5>' +
                          '</div>' +
                        '</div>' +
                        '<div class="big-content medium-content productQuantity">' +
                          '<select class="form-control" data-id="' + id + '">' +
                            option +
                          '</select>' +
                        '</div>' +
                        '<div class="big-content small-content">' +
                          '<h5>$ ' + price + '</h5>' +
                        '</div>' +
                    '</div>';
        }
        else{
            return '<li class="clearfix">' +
                      '<div class="item-content">' +
                        '<div class="item-image">' +
                          '<img src="' + image + '" alt="image">' +
                        '</div>' +
                        '<div class="item-details">' +
                          '<h6>' + name + '</h6>' +
                          '<div class="productQuantity"><select class="form-control" data-id="' + id + '">' +
                            option +
                          '</select></div>' +
                          '<div>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                      '<div class="item-price">' +
                        '<span>$ ' + price + '</span>' +
                      '</div>' +
                      '<a href="#" class="removeProduct" data-id="' + id + '">' +
                        '<i class="fa fa-times"></i>' +
                      '</a>' +
                    '</li>';
        }
    }


    //Update Cart length at page init
    getCartLength();

    //Update Cart items in cart area
    updatehtml();
    
    //Update total price in cart area
    updateTotal();

    /* On Click handler for add to cart.
        Usage add ``addToCart`` class to any button
        The button should have the following data parameters
        // data-productid
            - Id of the product. This must be unique. Internally all checking is done via this parameter
        // data-productname
            - Name of the product
        // data-productprice
            - Price of the product
        // data-productimage
            - Image URL of the product
    */

    $('.addToCart').on('click', function(e){
        e.preventDefault();
        var _this = $(this);

        var data = {
            id : _this.data('productid'),
            name : _this.data('productname'),
            price : _this.data('productprice'),
            image : _this.data('productimage'),
            quantity : 1
        };

       addToCart(data);

        _this.addClass('cart-added')
            .delay( 1000 )
            .queue(function() {
               $(this).removeClass('cart-added');
               $(this).dequeue();
            });

    });
    $('.buy-btn').on('click', function(){
        var _this = $(this).prev();

        var data = {
            id : _this.data('productid'),
            name : _this.data('productname'),
            price : _this.data('productprice'),
            image : _this.data('productimage'),
            quantity : 1
        };

        if(!(data.id === undefined || data.name === undefined || data.price === undefined || data.image === undefined)){
         
            addToCart(data);
        }
    });

    $('.productQuantity select').on('change', function () {
        
        var val = $(this).val(),
            id = $(this).data('id');
        for(var i = 0; i < $cartquantity; i++){
            if(id === $cartitems[i].id){
                $cartitems[i].quantity = val;
                break;
            }
        }

        updateSession();
        updateTotal();
    });

    $('.removeProduct').on('click', function(e){
        e.preventDefault();
        var id = $(this).data('id');
        removeProduct(id, $(this));
    });

  /*--------- nav menu ---------*/
  $('.submenu').prev().addClass('toggle-dropdown');
  function toggleDropdown() {
     if ($windowWidth <= 991){ 
        $('.toggle-dropdown').on('click',function(event){
          event.preventDefault();
          $(this).next().slideToggle();
        });
     }else {
      $('.toggle-dropdown').unbind('click');
     }  
  }
  toggleDropdown();

  function showDate(elem) {
    var d = new Date();
    var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    var month = ['January','February','March','April','May','June','July','August','September','October','November','December'];  
    var year = d.getFullYear();
    var datestr = days[d.getDay()]+' '+' '+d.getDate()+month[d.getMonth()]+' '+year;
    elem.html(datestr);
  }
  if($('.datetime').length){
    showDate($('.datetime'));
  }





  $('a.back-to-top').on('click', function(event) {    
    $('html, body').stop().animate({
      scrollTop: $('body').offset().top
    }, 1500);
    event.preventDefault();
  });

  $('.selectbox_itemlist span').on('click',function () {
      var pick, value, parent;
      pick = $(this).text();
      value = $(this).attr('data-value');
      parent = $(this).parent().parent();
      parent.find('.selectbox_toggle').text(pick)
      .append('<span class="selectbox__arrow"></span>')
      .attr('data-value', value);
      parent.find('.selectbox__input').val(value);
  });
  $('.selectbox_toggle').on('click',function(e){  
    e.stopPropagation();
    $(this).toggleClass('selectbox_toggle__active');
    $('.selectbox_toggle').parent().removeClass('open');
    $(this).parent().toggleClass('open');
  });
  $(window).on('click',function(){
    $('.selectbox.open').removeClass('open');
    $('.selectbox_toggle__active').removeClass('selectbox_toggle__active');
  });


  /* WAYPOINTS */
  /* ----- WAYPOINT ANIMATION FUNCTION ----- */
  function headingAnimateOuter(sectionClass){
    if(sectionClass.length){
      sectionClass.waypoint(function() {
        headingAnimateInner(sectionClass);
      }, { offset: '95%' });
    }
  }
  function headingAnimateInner(sectionName){
    setTimeout(function(){sectionName.find('h1 span').addClass('animate')},100);
    setTimeout(function(){sectionName.find('h2').addClass('animated fadeInUp')},600);
  }/* ------------------------------------------- */

  function wayPoint() {
    if($(window).width() > 750){
      var midpageBanner4 =  $('#midpage-banner4');
      if(midpageBanner4.length){
        midpageBanner4.waypoint(function() {
          midpageBanner4.find('.ipad').addClass('animated');
          midpageBanner4.find('.cap').addClass('animated');
        }, { offset: '45%' });
      }
      
      var tableBookHeading =  $('.table-book .section-heading');
      headingAnimateOuter(tableBookHeading);
      var serviceHeading =  $('.service-section .section-heading');
      headingAnimateOuter(serviceHeading);
      var specialMenuHeading =  $('.special-menu .section-heading');
      headingAnimateOuter(specialMenuHeading);
      var onlineStoreHeading =  $('.online-store .section-heading');
      headingAnimateOuter(onlineStoreHeading);
      var testimonialHeading =  $('.testimonial-sectn .section-heading');
      headingAnimateOuter(testimonialHeading);
      var eventSlideHeading =  $('.events-slide .section-heading');
      headingAnimateOuter(eventSlideHeading);
      var contactHeading =  $('.contact-sectn .section-heading');
      headingAnimateOuter(contactHeading);

      var orderTypes =  $('.order-types-available');
      if(orderTypes.length){
        orderTypes.waypoint(function() {
          orderTypes.find('.order-type-wrapper:nth-of-type(1)').addClass('animated fadeInLeft');
          setTimeout(function(){orderTypes.find('.order-type-wrapper:nth-of-type(2)').addClass('animated fadeInUp')},300);
          setTimeout(function(){orderTypes.find('.order-type-wrapper:nth-of-type(3)').addClass('animated fadeInRight')},600);
        }, { offset: '65%' });
      }

      var serviceItems =  $('.service-details');
      if(serviceItems.length){
        serviceItems.waypoint(function() {
          serviceItems.find('.service-wrapper:nth-of-type(1)').addClass('animated bounceInUp');
          setTimeout(function(){serviceItems.find('.service-wrapper:nth-of-type(2)').addClass('animated bounceInUp')},100);
          setTimeout(function(){serviceItems.find('.service-wrapper:nth-of-type(3)').addClass('animated bounceInUp')},200);
          setTimeout(function(){serviceItems.find('.service-wrapper:nth-of-type(4)').addClass('animated bounceInUp')},300);
          setTimeout(function(){serviceItems.find('.service-wrapper:nth-of-type(5)').addClass('animated bounceInUp')},400);
          setTimeout(function(){serviceItems.find('.service-wrapper:nth-of-type(6)').addClass('animated bounceInUp')},500);
        }, { offset: '45%' });
      }

      // var headerBanner =  $('.header-body .banner-img-holder');
      // if(headerBanner.length){
      //   headerBanner.waypoint(function() {
      //     headerBanner.find('.cup').addClass('animated fadeInUp');
      //     setTimeout(function(){headerBanner.find('.coffee-drop').addClass('poured')},500);
      //     setTimeout(function(){headerBanner.find('.premium-text').addClass('animated fadeInLeft')},2000);
      //     setTimeout(function(){headerBanner.find('.coffee-text').addClass('animated fadeInRight')},2500);
      //   }, { offset: '50%' });
      // }

      var reservationTable =  $('.reservation-form');
      if(reservationTable.length){
        reservationTable.waypoint(function() {
          reservationTable.addClass('animated slideInUp');
        }, { offset: '70%' });
      }

      var storeCategories =  $('ul.categories');
      if(storeCategories.length){
        storeCategories.waypoint(function() {
          storeCategories.find('li:nth-of-type(1)').addClass('animated bounceIn');
          setTimeout(function(){storeCategories.find('li:nth-of-type(2)').addClass('animated bounceIn')},100);
          setTimeout(function(){storeCategories.find('li:nth-of-type(3)').addClass('animated bounceIn')},200);
          setTimeout(function(){storeCategories.find('li:nth-of-type(4)').addClass('animated bounceIn')},300);
          setTimeout(function(){storeCategories.find('li:nth-of-type(5)').addClass('animated bounceIn')},400);
          setTimeout(function(){storeCategories.find('li:nth-of-type(6)').addClass('animated bounceIn')},500);
        }, { offset: '70%' });
      }

      var milkPour =  $('.midpage-banner1 .img-holder');
      if(milkPour.length){
        milkPour.waypoint(function() {
          setTimeout(function(){milkPour.find('.cup').addClass('animated fadeInUp')},0);
          setTimeout(function(){milkPour.find('.milk').addClass('animate')},1000);
          setTimeout(function(){milkPour.find('.milk-drop').addClass('appear')},2500);
        }, { offset: '50%' });
      }

      // INNER PAGE BANNER TEXT + IMAGE
      // var innerPageBanner =  $('.inner-page .banner');
      // if(innerPageBanner.length){
      //   innerPageBanner.waypoint(function() {
      //     setTimeout(function(){innerPageBanner.find('.banner-text h2 span').addClass('animated fadeInRight')},500);
      //     setTimeout(function(){innerPageBanner.find('.banner-img img').addClass('animated fadeInLeft')},1000);
      //   }, { offset: '40%' });
      // }

      // MENU PAGE WAYPOINT
      var pricingMenu =  $('.menu-sectn');
      if(pricingMenu.length){
        pricingMenu.find('.pricing-table').waypoint(function() {
          pricingMenu.find('.pricing-table').addClass('animated fadeInLeft');
        }, { offset: '40%' });

      }
    }
  }
  wayPoint();
  $(window).resize(function(){
    wayPoint();
  });


  $('.mfp-image').magnificPopup({
    type:'image',
    gallery:{
      enabled:true,
    },
    removalDelay: 500,
    callbacks: {
       beforeOpen: function() {
             // just a hack that adds mfp-anim class to markup 
              this.st.image.markup = this.st.image.markup.replace('mfp-figure', 'mfp-figure mfp-with-anim');
              this.st.mainClass = 'mfp-zoom-in';
           }
     }
  });

})(jQuery);