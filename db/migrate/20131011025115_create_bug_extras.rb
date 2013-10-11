class CreateBugExtras < ActiveRecord::Migration
  def change
    create_table :bug_extras do |t|
      t.string :extra_fields
      t.references :bug

      t.timestamps
    end
    add_index :bug_extras, :bug_id
  end
end
