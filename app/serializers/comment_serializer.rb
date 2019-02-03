class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_text , :likes ,:dislikes
end
