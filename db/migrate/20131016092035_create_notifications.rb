class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user
      t.string :model_name
      t.integer :model_id
      t.text :content
      t.boolean :readed, :default => false

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
