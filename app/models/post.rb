class Post <  ActiveRecord::Base

  belongs_to :user

  acts_as_followable

  has_one :image, as: :viewable, class_name: 'Asset::PostImage', dependent: :destroy
  accepts_nested_attributes_for :image

end