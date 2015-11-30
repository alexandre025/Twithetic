class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :posts

  has_many :comments

  acts_as_followable
  acts_as_follower

  has_one :image, as: :viewable, class_name: 'Asset::UserImage', dependent: :destroy
  accepts_nested_attributes_for :image

  extend FriendlyId
  friendly_id :username

end
