class CreateHashtagTable < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :name, null: false
      t.integer :count, null: false
      t.timestamps
    end
    add_index :hashtags, :name, unique: true
  end
end
