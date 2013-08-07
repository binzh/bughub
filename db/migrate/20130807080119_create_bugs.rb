class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :summary
      t.references :status
      t.references :priority
      t.references :user
      t.integer :owner
      t.text :description

      t.timestamps
    end
    add_index :bugs, :status_id
    add_index :bugs, :priority_id
    add_index :bugs, :user_id
  end
end
