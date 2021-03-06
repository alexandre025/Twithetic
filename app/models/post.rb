class Post < ActiveRecord::Base

  include InjectLinks

  # Scope
  default_scope { order(created_at: :desc) }

  # Associations
  belongs_to :user

  belongs_to :parent, class_name: 'Post'

  has_one :image, as: :viewable, class_name: 'Asset::PostImage', dependent: :destroy
  accepts_nested_attributes_for :image

  has_many :comments, dependent: :destroy

  # Validates
  validates :message, length: { maximum: 140 }

  # Is followable
  acts_as_followable

  # Methods
  def retweet(by_user)
    raise Exception, "User can't retweet is own tweet" if by_user.id == self.user.id
    retweet = self.dup
    retweet.parent = self.parent ? self.parent : self
    retweet.user = by_user
    return retweet
  end

  def count_retweet
    Post.where(parent: self).size
  end

  def retweeted?(user)
    Post.where(parent: self, user: user).empty?
  end

  def is_a_retweet?
    self.parent.present?
  end

end
