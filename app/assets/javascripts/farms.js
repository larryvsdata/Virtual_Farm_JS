$(function () {
	console.log('farms.js loaded ... ');

	// listenForClickToGetFarms()
	// getFarms()
})

function listenForClickToGetFarms() {
	$('h1').on('click', function (event) {
		event.preventDefault()
		getFarms()
	})
}

function getFarms() {
	$.ajax({
		url: 'http://127.0.0.1:3000/farms',
		method: 'get',
		dataType: 'json'
	}).done(function (response) {

		console.log(response);
	//	debugger;
	})
}





// JS Model Object

// class Farm {
// 	constructor(obj){

// 	}
// }
