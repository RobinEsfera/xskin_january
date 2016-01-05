$(document).on("change","#product_device_id",function(){
	var device_id = $("#product_device_id").val();
	// alert(device_id);

	// var base_url = window.location.origin;
	//   var post_data = {
	//     'device_id' : device_id
	//   };
	//   $.ajax({ 
	//     url: base_url+"/ajax/get_sub_device",
	//   //$.ajax({
	//     type: "POST",
	//     data: post_data,
	//     dataType: "json",
	//     success: function(response) //we're calling the response json array 'cities'
	//     {  
	//     	var _sub_device = "";
	//         if(response != '')
	//         {
	//           $.each(response, function (key, value) {
	//               _sub_device+="<option value='"+value.id+"'>"+value.name+"</option>";
	//           });
	//         }
	//         else
	//         {
 //               _sub_device+="<option></option>";
	//         }
	//         $("#product_sub_device_id").html(_sub_device);
	//     },
	//     error: function()
	//     {
	//        // return false;

	//     }
	//   });
});