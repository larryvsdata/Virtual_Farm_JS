$(function () {
	console.log("comments_index.js loaded..")

	loadPreviousComments() ;
	getComment();
	releaseFullInfo();

})




function getLike(){
	// console.log('Inside getLike');
	$('.likes').on('click',function (event) {
		event.preventDefault();
		// console.log($(this).attr('id'));
		incrementLike($(this).attr('id'));
	})
}

function getDislike(){
	// console.log('Inside getLike');
	$('.dislikes').on('click',function (event) {
		event.preventDefault();
		 // console.log($(this).attr('id'));
		incrementDislike($(this).attr('id'));
	})
}


function alterLikeLabel(like_id){

	$.ajax({
		url: 'http://localhost:3000/comments/'+like_id,
		 type: 'GET',
		 dataType: 'json',

	}).done(function (response) {
		// console.log(response.likes);

		if(response.likes > 0){
			$('.likes#'+like_id).text('LIKES:'+response.likes)
		}

		});

}


function alterDislikeLabel(dislike_id){

	$.ajax({
		url: 'http://localhost:3000/comments/'+dislike_id,
		 type: 'GET',
		 dataType: 'json',

	}).done(function (response) {
		 // console.log(response.dislikes);

		if(response.dislikes > 0){
			// $('.dislikes#'+dislike_id).text('DISLIKES:'+response.dislikes)
			$('#'+dislike_id+'.dislikes').text('DISLIKES:'+response.dislikes)
		}

		});

}

function incrementLike(like_id){
	$.ajax({
		url: 'http://localhost:3000/comments/'+like_id+'/increment_likes',
		 type: 'PATCH',
		 dataType: 'json',

	}).done(function (response) {
		alterLikeLabel(like_id);

		});

}

function incrementDislike(dislike_id){
	$.ajax({
		url: 'http://localhost:3000/comments/'+dislike_id+'/increment_dislikes',
		 type: 'PATCH',
		 dataType: 'json',

	}).done(function (response) {
		alterDislikeLabel(dislike_id);
   // console.log(dislike_id);
		});

}


function loadPreviousComments(){

	$.ajax({
		url: 'http://localhost:3000/comments',
		 type: 'GET',
		 dataType: 'json',

	}).done(function (responses) {


		responses.forEach(function(response) {
			// console.log(response.id);
			let myNewComment = new MyComment(response);
		//	 console.log(myNewComment)
			let myNewCommentHtml = myNewComment.commentHTML();
			 $('div#comments').append(myNewCommentHtml);
			 alterLikeLabel(response.id);
			 alterDislikeLabel(response.id);
		});
	 getLike();
	 getDislike();
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
			// console.log(subClassText);
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

			 $('div#comments').append(myNewCommentHtml)
			 getLike();
			 getDislike();
		});

	})
}


class MyComment {
	constructor(obj) {
		this.comment_text = obj.comment_text
		this.comment_id = obj.id
	}
}

MyComment.prototype.commentHTML = function () {
	return (`
	<div>
		<li>${this.comment_text}</li>
	</div> <br>
	 <button class = "likes" id = ${this.comment_id}> LIKE </button>
	 <button class = "dislikes" id = ${this.comment_id}> DISLIKE </button>

`)
}

// comment-id="<%= this.id %>"
