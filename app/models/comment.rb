class Comment < ApplicationRecord

  def increment_likes
    self.likes += 1
    self.save
  end

  def increment_dislikes
    self.dislikes += 1
    self.save
  end

end
