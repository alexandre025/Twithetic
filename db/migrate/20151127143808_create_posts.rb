class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :message, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
