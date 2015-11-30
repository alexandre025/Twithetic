class Post <  ActiveRecord::Base

  belongs_to :user

  belongs_to :parent, class_name: 'Post'

  acts_as_followable

  has_one :image, as: :viewable, class_name: 'Asset::PostImage', dependent: :destroy
  accepts_nested_attributes_for :image

  def count_retweet
    Post.where(parent: self).size
  end

  def retweeted?(user)
    Post.where(parent: self, user: user).empty?
  end

end