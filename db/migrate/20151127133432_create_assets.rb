class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :viewable, polymorphic: true
      t.string :type
      t.text :alt
      t.integer :attachment_width
      t.integer :attachment_height
      t.timestamps
    end
  end
end
