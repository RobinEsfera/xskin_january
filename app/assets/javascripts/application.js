// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require jquery-ui/slider
//= require foundation
//= require turbolinks
//= require slick
//= require angular
//= require angular-sanitize
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
  // $('#site_admin .left-off-canvas-menu').enscroll();
	var $alertBox = $('.xskin-flash-message');
    // fade $alertBox out after 1 second (1000 ms)
    $alertBox.delay(1800).fadeOut('slow');
  // Slick slider implementation..........
  $('.slide-start').slick({
  	 dots: true,
  infinite: true,
  speed: 300,
  slidesToShow: 1,
  autoplay: true,
  adaptiveHeight: true
  });
// 
$(".xskin-edit").click(function(){
  $(".xskin-edit-form").slideToggle("slow");
  $(".xskin-password-form").slideUp("slow");
});
$(".xskin-password").click(function(){
  $(".xskin-password-form").slideToggle("slow");
  $(".xskin-edit-form").slideUp("slow");
});
// currency 

$(".world-currency li a").click(function(){
	$(".world-currency li a").removeClass("active-currency");
	$(this).addClass("active-currency");
	currency_val=$(this).text();
	$("#selected_currency").val(currency_val);
});
// Shipping
$("#shipping-address").click(function(){
  $(".shipping-edit-details").slideToggle("slow");

});
//Billing

$("#billing-address").click(function(){
  $(".billing-edit-details").slideToggle("slow");

});

$(function() {
  $('.da-thumbs .spotting-hover').hoverdir();
});



$(".search_content").click(function(){
  // var element = $(this);
  $(".xskin-mobile-search").toggle();
  $(".enter-keywords input").focus();
});
$(".close-search").click(function(){
  // var element = $(this);
  $(".xskin-mobile-search").hide();
});

// answer toggle
$(".action-answer").click(function(){

$(this).parent("li").find(".answer-the-question").fadeToggle("slow");

});
// xskin-device-color toggle
$(".xskin-device-control").click(function(){

    $(".xskin-device-control i").toggleClass("fa-angle-down")
    $(".xskin-device-control i").toggleClass("fa-angle-up")

  $(".xskin-device-list").slideToggle("slow");
});
$(".xskin-case-control").click(function(){

    $(".xskin-case-control i").toggleClass("fa-angle-down")
    $(".xskin-case-control i").toggleClass("fa-angle-up")

  $(".xskin-case-list").slideToggle("slow");
});

$("ul.thumbnail-views li a img").click(function(){
var img_path = $(this).attr("src");
$(".xskin-product-view img.product-preview").attr("src",img_path);

});

/* admin Js for the hover effect */
  
      /*  $('.have-drop').hover(function(){
       $(this).next(".xskin-dropdown").addClass("active");
    }, function(){
         $(this).next(".xskin-dropdown").removeClass("active");
    });

});*/
$(".have-drop").click(function() {
  $(this).next(".xskin-dropdown").toggleClass("active");

});
});
/* admin Js for the hover effect */
$(document).on("click",".xskin-device-filter .xskin-device-color label", function(){
  var current_url = window.location.href;
  var device = "";
  var element = $(this);
  var device_id = $(this).siblings("input").attr('device_id');

  var arrURL = (current_url).split('&');
  $.each(arrURL, function(idx2,val2) {  
    if (val2.indexOf("device=") >= 0)
      device = idx2;
  });

  if($(this).siblings("input").is(':checked'))
  {
    var device_sep = (arrURL[device]).split('=');
    var device_sep_sec = (device_sep[1]).split(',');
    if(device_sep_sec.length == 1)
    {
      // delete arrURL[device];
      arrURL.splice(device,1);
    }
    else
    {
      $.each(device_sep_sec, function(idx1,val1) {  
        if (val1 == device_id)
        {
          console.log(device_sep_sec[idx1]);
          // delete device_sep_sec[idx1];
          // alert(device_sep_sec[idx1]);
          device_sep_sec.splice(idx1,1);
        }
      });
      device_sep[1] = device_sep_sec.join(",");
      // device_sep[1] = device_sep[1].replace(/,\s*$/, '');
      arrURL[device] = device_sep.join("=");
    }
    // console.log(device_sep_sec);
  }
  else
  {
    if(device != '')
    {
      arrURL[device] = arrURL[device]+","+device_id;
    }
    else
    {
      arrURL[arrURL.length] = "device="+device_id;      
    }
  }
  var redirectURL = arrURL.join("&");
  // console.log(redirectURL);
  window.location = redirectURL;

});

$(document).on("click",".xskin-case-filter .xskin-device-color label", function(){
  var current_url = window.location.href;
  var caseData = "";
  var element = $(this);
  var case_id = $(this).siblings("input").attr('case_id');

  var arrURL = (current_url).split('&');
  $.each(arrURL, function(idx2,val2) {  
    if (val2.indexOf("case=") >= 0)
      caseData = idx2;
  });

  if($(this).siblings("input").is(':checked'))
  {
    var case_sep = (arrURL[caseData]).split('=');
    var case_sep_sec = (case_sep[1]).split(',');
    if(case_sep_sec.length == 1)
    {
      // delete arrURL[device];
      arrURL.splice(caseData,1);
    }
    else
    {
      $.each(case_sep_sec, function(idx1,val1) {  
        if (val1 == case_id)
        {
          console.log(case_sep_sec[idx1]);
          // delete device_sep_sec[idx1];
          // alert(device_sep_sec[idx1]);
          case_sep_sec.splice(idx1,1);
        }
      });
      case_sep[1] = case_sep_sec.join(",");
      // device_sep[1] = device_sep[1].replace(/,\s*$/, '');
      arrURL[caseData] = case_sep.join("=");
    }
    // console.log(device_sep_sec);
  }
  else
  {
    if(caseData != '')
    {
      arrURL[caseData] = arrURL[caseData]+","+case_id;
    }
    else
    {
      arrURL[arrURL.length] = "case="+case_id;      
    }
  }
  var redirectURL = arrURL.join("&");
  // console.log(redirectURL);
  window.location = redirectURL;

});


$(document).on("click",".xskin-brand-filter .xskin-device-color label", function(){
  var current_url = window.location.href;
  var brand = "";
  var element = $(this);
  var brand_id = $(this).siblings("input").attr('brand_id');

  var arrURL = (current_url).split('&');
  $.each(arrURL, function(idx2,val2) {  
    if (val2.indexOf("brand=") >= 0)
      brand = idx2;
  });

  if($(this).siblings("input").is(':checked'))
  {
    var brand_sep = (arrURL[brand]).split('=');
    var brand_sep_sec = (brand_sep[1]).split(',');
    if(brand_sep_sec.length == 1)
    {
      // delete arrURL[brand];
      arrURL.splice(brand,1);
    }
    else
    {
      $.each(brand_sep_sec, function(idx1,val1) {  
        if (val1 == brand_id)
        {
          console.log(brand_sep_sec[idx1]);
          // delete device_sep_sec[idx1];
          // alert(device_sep_sec[idx1]);
          brand_sep_sec.splice(idx1,1);
        }
      });
      brand_sep[1] = brand_sep_sec.join(",");
      // brand_sep[1] = device_sep[1].replace(/,\s*$/, '');
      arrURL[brand] = brand_sep.join("=");
    }
    // console.log(device_sep_sec);
  }
  else
  {
    if(brand != '')
    {
      arrURL[brand] = arrURL[brand]+","+brand_id;
    }
    else
    {
      arrURL[arrURL.length] = "brand="+brand_id;      
    }
  }
  var redirectURL = arrURL.join("&");
  // console.log(redirectURL);
  window.location = redirectURL;

});

$(document).on("click",".xskin-product-color li label", function(){
  var color_id = $(this).siblings("input").attr('color_id');
  var base_url = window.location.origin;
  // alert(color_id);

    var post_data = { 
        'color_id'  :  color_id
    };
    $.ajax({ 
        url: base_url+"/page/get_product_from_color",

        type: "POST",
        data: post_data,
        dataType: "json",      
        success: function(response) //we're calling the response json array 'cities'
        {
          if (response.id)
            window.location = base_url+"/product?product="+response.id;
          else
            alert("Sorry! There is no product with this color.");
        },
        error: function(response)
        {
            console.log(response);
        }
        
    });

});

$(document).on("click",".xskin-color-filter li label", function(){
  var current_url = window.location.href;
  var color = "";
  var element = $(this);
  var color_id = $(this).siblings("input").attr('color_id');

  var arrURL = (current_url).split('&');
  $.each(arrURL, function(idx2,val2) {  
    if (val2.indexOf("color=") >= 0)
      color = idx2;
  });

  if($(this).siblings("input").is(':checked'))
  {
    var color_sep = (arrURL[color]).split('=');
    var color_sep_sec = (color_sep[1]).split(',');
    if(color_sep_sec.length == 1)
    {
      // delete arrURL[color];
      arrURL.splice(color,1);
    }
    else
    {
      $.each(color_sep_sec, function(idx1,val1) {  
        if (val1 == color_id)
        {
          console.log(color_sep_sec[idx1]);
          // delete device_sep_sec[idx1];
          // alert(device_sep_sec[idx1]);
          color_sep_sec.splice(idx1,1);
        }
      });
      color_sep[1] = color_sep_sec.join(",");
      // color_sep[1] = device_sep[1].replace(/,\s*$/, '');
      arrURL[color] = color_sep.join("=");
    }
    // console.log(device_sep_sec);
  }
  else
  {
    if(color != '')
    {
      arrURL[color] = arrURL[color]+","+color_id;
    }
    else
    {
      arrURL[arrURL.length] = "color="+color_id;      
    }
  }
  var redirectURL = arrURL.join("&");
  // console.log(redirectURL);
  window.location = redirectURL;

});

$(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 10000,
      values: [ $("#price_min").val(), $("#price_max").val() ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  });


$(document).on("mouseup","#slider-range span",function(evented){
  // alert("hello");
  var price_min = $( "#slider-range" ).slider( "values", 0 );
  var price_max = $( "#slider-range" ).slider( "values", 1 );

  var price_min_ind = '';
  var price_max_ind = '';
  var current_url = window.location.href;

  var arrURL = (current_url).split('&');
  $.each(arrURL, function(idx2,val2) {  
    if (val2.indexOf("price_min=") >= 0)
      price_min_ind = idx2;
    if (val2.indexOf("price_max=") >= 0)
      price_max_ind = idx2;
  });

  if(price_min_ind != '')
    arrURL[price_min_ind] = "price_min="+price_min;   
  else
    arrURL[arrURL.length] = "price_min="+price_min; 

  if(price_max_ind != '')      
    arrURL[price_max_ind] = "price_max="+price_max;  
  else      
    arrURL[arrURL.length] = "price_max="+price_max;

  // console.log(arrURL);
  var redirectURL = arrURL.join("&");
  window.location = redirectURL;
});

/****************** Promotion Tool *******************************/
$(document).on("click","ul.promotion li .see-detail, ul.promotion li .close-detail", function(){
  $(this).parents("li").find(".see-detail").toggle();
  $(this).parents("li").find(".close-detail").toggle();
  $(this).parents("li").find(".offer-term-and-condition").slideToggle("slow");
});

/****************** Track Order Tool *******************************/
$(document).on("click","table.track_order .see-detail, table.track_order .close-detail", function(){
  $(this).parents("tr").find(".see-detail").toggle();
  $(this).parents("tr").find(".close-detail").toggle();
  $(this).parents("tr").next(".track_order_detail").toggle("slow");
});


$(document).on("click","ul.multiple-case li",function(){
  var case_id = $(this).attr("data-case_id");
  var base_url = window.location.origin;
   $("ul.multiple-case li").removeClass('case-active'); 
   $(this).addClass("case-active");
  // alert(color_id);

    var post_data = { 
        'case_id'  :  case_id
    };
    $.ajax({ 
        url: base_url+"/page/get_cases_from_id",

        type: "POST",
        data: post_data,
        dataType: "json",      
        success: function(response) //we're calling the response json array 'cities'
        {
          var _html="";
          $.each(response, function(idx,val){
            // console.log(val.image);
            _html+="<li>";
              _html+="<a data-layout_id='"+val.id+"'>";
              _html+="<img src='"+val.image.thumb.url+"'/>";
              _html+="</a>";
            _html+="</li>";
          });
          $("ul.xskin-case-layout").html(_html);
        },
        error: function(response)
        {
            console.log(response);
        }
        
    });
});

$(document).on("click",".list-images span.xskin-overlay", function(){
  $(this).parent("li").remove();

  var image_name = $(this).parent("li").find("img").attr('alt');

  var base_url = window.location.origin;

  var post_data = { 
      'image_name'  :  image_name
  };
  $.ajax({ 
      url: base_url+"/page/upload_image_remove",

      type: "POST",
      data: post_data,
      dataType: "json",      
      success: function(response) //we're calling the response json array 'cities'
      {
      },
      error: function(response)
      {
      }
      
  });
});

/************************* Cart System *****************************/
$(document).on("blur",".cart-update",function(){
  // alert("hello");
  var product_id = $(this).parents(".cart-product").attr("data-product_id");
  var quantity = $(this).val();
  
  if(quantity > 0)
  {
    var base_url = window.location.origin;

    var post_data = { 
        'id'  :  product_id,
        'quantity'  :  quantity
    };
    $.ajax({ 
        url: base_url+"/cart/"+product_id,

        type: "POST",
        data: post_data,
        dataType: "json",      
        success: function(response) //we're calling the response json array 'cities'
        {
          window.location = window.location.href;
        },
        error: function(response)
        {
        }
        
    });
  }
  else
  {
    alert("Product quantity should be greater than zero.");
  }
});

$(document).on("click",".billing_check",function(){
   $(".billing-address").slideToggle("slow");  
});

$(document).on("click","#get_billing",function(){
   var base_url = window.location.origin;

    var post_data = { 
        'test'  :  'test'
    };
    $.ajax({ 
        url: base_url+"/page/get_billing_address",

        type: "POST",
        data: post_data,
        dataType: "json",      
        success: function(response) //we're calling the response json array 'cities'
        {
          console.log(response);
        },
        error: function(response)
        {
        }
        
    });
});

$(document).on("click","#ship_new_address",function(){

  $("#checkout_shipping_first_name, #checkout_shipping_last_name, #checkout_shipping_address, #checkout_shipping_city, #checkout_shipping_state, #checkout_shipping_pincode, #checkout_shipping_mobile").val("");
});
$(document).on("click","#get_shipping",function(){
   var base_url = window.location.origin;

    var post_data = { 
        'test'  :  'test'
    };
    $.ajax({ 
        url: base_url+"/page/get_shipping_address",

        type: "POST",
        data: post_data,
        dataType: "json",      
        success: function(response) //we're calling the response json array 'cities'
        {
          if (response)
          {
            $("#checkout_shipping_first_name").val(response.first_name);
            $("#checkout_shipping_last_name").val(response.last_name);
            $("#checkout_shipping_address").val(response.address1);
            $("#checkout_shipping_city").val(response.city);
            $("#checkout_shipping_state").val(response.state);
            $("#checkout_shipping_pincode").val(response.pincode);
            $("#checkout_shipping_mobile").val(response.mobile);
          }
        },
        error: function(response)
        {
        }
        
    });
});
$(document).on("click","#bill_new_address",function(){

  $("#checkout_billing_first_name, #checkout_billing_last_name, #checkout_billing_address, #checkout_billing_city, #checkout_billing_state, #checkout_billing_pincode, #checkout_billing_mobile").val("");
});
$(document).on("click","#get_billing",function(){
   var base_url = window.location.origin;

    var post_data = { 
        'test'  :  'test'
    };
    $.ajax({ 
        url: base_url+"/page/get_billing_address",

        type: "POST",
        data: post_data,
        dataType: "json",      
        success: function(response) //we're calling the response json array 'cities'
        {
          if (response)
          {
            $("#checkout_billing_first_name").val(response.first_name);
            $("#checkout_billing_last_name").val(response.last_name);
            $("#checkout_billing_address").val(response.address);
            $("#checkout_billing_city").val(response.city);
            $("#checkout_billing_state").val(response.state);
            $("#checkout_billing_pincode").val(response.pincode);
            $("#checkout_billing_mobile").val(response.mobile);
          }
        },
        error: function(response)
        {
        }
        
    });
});
  

/************************ Backend Javascript *****************************/
$(document).on("change",".ajax_store_category_id",function(){
  var store_category_id = $(".ajax_store_category_id").val();
   // alert(store_category_id);

  var base_url = window.location.origin;
    var post_data = {
      'store_category_id' : store_category_id
    };
    $.ajax({ 
      url: base_url+"/ajax/get_store_sub_category",
    //$.ajax({
      type: "POST",
      data: post_data,
      dataType: "json",
      success: function(response) //we're calling the response json array 'cities'
      {  
       var _store_sub_category = "";
          if(response != '')
          {
            $.each(response, function (key, value) {
                _store_sub_category+="<option value='"+value.id+"'>"+value.name+"</option>";
            });
          }
          else
          {
               _store_sub_category+="<option></option>";
          }
          $(".ajax_store_sub_category_id").html(_store_sub_category);
      },
      error: function()
      {
         // return false;

      }
    });
});

$(document).on("change",".ajax_device_id",function(){
  var device_id = $(".ajax_device_id").val();
   // alert(store_category_id);

  var base_url = window.location.origin;
    var post_data = {
      'device_id' : device_id
    };
    $.ajax({ 
      url: base_url+"/ajax/get_sub_device",
    //$.ajax({
      type: "POST",
      data: post_data,
      dataType: "json",
      success: function(response) //we're calling the response json array 'cities'
      {  
       var _sub_device = "";
          if(response != '')
          {
            $.each(response, function (key, value) {
                _sub_device+="<option value='"+value.id+"'>"+value.name+"</option>";
            });
          }
          else
          {
               _sub_device+="<option></option>";
          }
          $(".ajax_sub_device_id").html(_sub_device);
      },
      error: function()
      {
         // return false;

      }
    });
});


$(document).on("click","#new_product .add_variation", function() {
  var count_element = ($("#new_product .product_variations").length);
  alert(count_element);

  var extra_row = $("#product-variation-extra").html();
  var final4 = extra_row.replace(/extra/g,count_element+1);

  $("#product-variation-form").append(final4);

});