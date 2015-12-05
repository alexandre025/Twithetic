class Post < ActiveRecord::Base

  # Scope
  default_scope { order(created_at: :desc) }

  # Associations
  belongs_to :user

  belongs_to :parent, class_name: 'Post'

  has_one :image, as: :viewable, class_name: 'Asset::PostImage', dependent: :destroy
  accepts_nested_attributes_for :image

  has_many :comments, dependent: :destroy

  has_many :retweets, class_name: 'Post', dependent: :destroy

  # Is followable
  acts_as_followable

  # Methods
  after_save :parse_hashtags

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

  def parse_hashtags
    hashtags = self.message.scan(/(#\w+)/).flatten
    hashtags.each do |h|
      tag = h.tr('#', '')
      stored_hashtag = Hashtag.where(name: tag).first
      if stored_hashtag.present?
        stored_hashtag.mention = stored_hashtag.mention + 1
        stored_hashtag.save
      else
        Hashtag.create(name: tag)
      end
    end
  end

end
