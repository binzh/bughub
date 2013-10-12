class CreateBugHistories < ActiveRecord::Migration
  def change
    create_table :bug_histories do |t|
      t.references :bug
      t.string :bug_field
      t.string :old_value
      t.string :new_value
      t.references :user

      t.timestamps
    end
    add_index :bug_histories, :bug_id
    add_index :bug_histories, :user_id
  end
end
