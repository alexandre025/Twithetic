class Post <  ActiveRecord::Base

  belongs_to :user
  has_many :likes

  has_one :image, as: :viewable, class_name: 'Asset::PostImage', dependent: :destroy
  accepts_nested_attributes_for :image

  def count_likes
    likes.size
  end

end