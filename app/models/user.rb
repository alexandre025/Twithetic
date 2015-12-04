class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :posts

  has_many :comments

  acts_as_followable
  acts_as_follower

  has_one :image, as: :viewable, class_name: 'Asset::UserImage', dependent: :destroy
  accepts_nested_attributes_for :image

  has_one :banner, as: :viewable, class_name: 'Asset::UserBanner', dependent: :destroy
  accepts_nested_attributes_for :banner

  extend FriendlyId
  friendly_id :username

  after_initialize do
    self.image = Asset::UserImage.new unless self.image
    self.banner = Asset::UserBanner.new unless self.banner
  end

end
