class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :posts

  has_one :photo, class_name: 'Asset::User'
  accepts_nested_attributes_for :photo

  extend FriendlyId
  friendly_id :username

end
