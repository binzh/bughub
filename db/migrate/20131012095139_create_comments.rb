class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :model_name
      t.integer :model_id
      t.text :comment
      t.references :user

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
