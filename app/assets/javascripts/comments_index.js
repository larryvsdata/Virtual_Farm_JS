$(function () {
	console.log("comments_index.js loaded..")
	loadPreviousComments() ;
	getComment();
	releaseFullInfo();

})

function loadPreviousComments(){

	$.ajax({
		url: 'http://localhost:3000/comments',
		 type: 'GET',
		 dataType: 'json',
		
	}).done(function (response) {

		// let myNewComment = new MyComment(response) ;
		// let myNewCommentHtml = myNewComment.commentHTML() ;
		//  $('div#comments').append(myNewCommentHtml) ;
		console.log(response);

	})

}


function releaseFullInfo(){
	$(".js-more").on("click", function() {
		var id = $(this).data("id");
		// console.log(id)
		$.get("/farms/" + id + ".json", function(data) {
			var farm = data;
		 // console.log(data)
			var descriptionText = "<p>" + farm["description"] + "</p>" ;
			var animalNames = farm.animals.map(animal => animal.name) ;

			let subClassText = '<br>Animal species in this farm are: ';
			for (var ii = 0 ; ii < animalNames.length ; ii++){
				subClassText += '<br>'+ (ii+1) + ") " +  animalNames[ii] + '</br>' ;
			}
			descriptionText += subClassText ;
			console.log(subClassText);
			$("#farm-" + id).html(descriptionText);

		});
	});

}


function getComment() {
	$('input#yourCommentSubmit').on('click', function (event) {
		event.preventDefault()

		let commentValue = $('#yourComment').val()
		let data = {
			comment: {
				comment_text: commentValue
			}
		}

		$.ajax({
			url: 'http://localhost:3000/comments',
			 type: 'POST',
			 dataType: 'json',
			data: data
		}).done(function (response) {

			let myNewComment = new MyComment(response)
			let myNewCommentHtml = myNewComment.commentHTML()

			// $('div#latest-comment').html(myNewCommentHtml)
			 $('div#comments').append(myNewCommentHtml)


		})
	})
}


class MyComment {
	constructor(obj) {
		this.comment_text = obj.comment_text
	}
}

MyComment.prototype.commentHTML = function () {
	return (`
	<div>
		<li>${this.comment_text}</li>
	</div>
`)
}
