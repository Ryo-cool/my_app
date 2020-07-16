class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text
      t.integer :image_id
      t.integer :usr_id
      t.timestamps
    end
  end
end
