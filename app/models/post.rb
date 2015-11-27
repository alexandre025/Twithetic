class Post <  ActiveRecord::Base

  belongs_to :user
  has_many :likes

  def count_likes
    likes.size
  end

end