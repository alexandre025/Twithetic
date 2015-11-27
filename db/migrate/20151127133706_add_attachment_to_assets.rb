class AddAttachmentToAssets < ActiveRecord::Migration
  def up
    add_attachment :assets, :attachment
  end

  def down
    remove_attachment :assets, :attachment
  end
end
