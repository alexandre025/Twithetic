class AddParentIdToPosts < ActiveRecord::Migration
  def change
    add_belongs_to :posts, :parent
  end
end
