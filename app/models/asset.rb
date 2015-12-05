class Asset < ActiveRecord::Base

  # Associations
  belongs_to :viewable, polymorphic: true

end