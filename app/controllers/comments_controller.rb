class CommentsController < ApplicationController
before_action :set_comment , only: [:show ,:edit , :update]
skip_before_action :verify_authenticity_token

def show
  comment = @comment
  respond_to do |format|
     format.html { render :show }
     format.json { render json: comment }
   end
end


def index
  comments = Comment.all
  render json: comments
end

def create
	# binding.pry
  @comment = Comment.create(comment_text: params[:comment][:comment_text])
  render json: @comment, status: 201
end


  private
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_text  )
  end
end
