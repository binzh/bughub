class CreateUserFields < ActiveRecord::Migration
  def change
    create_table :user_fields do |t|
      t.string :field_name
      t.references :field_type
      t.boolean :required

      t.timestamps
    end
    add_index :user_fields, :field_type_id
  end
end
