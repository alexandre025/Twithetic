class Post <  ActiveRecord::Base

  belongs_to :user
  has_many :likes

  has_one :image, class_name: 'Asset::Post'
  accepts_nested_attributes_for :image

  def count_likes
    likes.size
  end

end