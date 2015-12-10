class Comment < ActiveRecord::Base

  # Scope
  default_scope { order(created_at: :desc) }

  # Associations
  belongs_to :user

  belongs_to :post

  #Validates
  validates :message, length: { maximum: 140 }

end