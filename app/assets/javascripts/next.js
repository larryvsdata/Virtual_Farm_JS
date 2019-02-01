$(function () {
	console.log('next.js loaded ... ');
  addStuffToTrial() ;
	// listenForClickToGetFarms()
	// getFarms()
})


function addStuffToTrial() {
	$('.js-next').on('click', function (event) {
		event.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    // console.log('http://127.0.0.1:3000/farms/'+ nextId);
    $.ajax({
  		url: 'http://127.0.0.1:3000/farms/'+ nextId + ".json",
  		method: 'get',
  		dataType: 'json'
  	}).done(function (data) {

      var farm = data;
      console.log(farm["name"]);
      console.log(farm["description"]);
      console.log(farm["id"]);
      $(".farmName").text(farm["name"]);
      $(".farmDescription").text(farm["description"]);
            			// re-set the id to current on the link
    $(".js-next").attr("data-id", farm["id"]);
  	//	debugger;
  	})

    // console.log('Should be added')
		// $('#trial').text("Added Here ... ")
	})
}


// $(function () {
// 	$(".js-next").on("click", function () {
// 		var nextId = parseInt($(".js-next").attr("data-id")) + 1;
// 		console.log(nextId)
// 		$.get("/farms/" + nextId + ".json", function (data) {
// 			var farm = data;
// 			console.log(farm["name"]);
// 			console.log(farm["description"]);
// 			console.log(farm["id"]);
// 			$(".farmName").text(farm["name"]);
// 			$(".farmDescription").text(farm["description"]);
// 			// re-set the id to current on the link
// 			$(".js-next").attr("data-id", farm["id"]);
// 		});
// 	});
// });
