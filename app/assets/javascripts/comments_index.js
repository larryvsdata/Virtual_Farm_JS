$(function () {
	console.log("comments_index.js loaded..")
	getComment()


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
				type: 'post',
				// dataType: 'json',
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


})
