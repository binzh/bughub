class CreateEnumFields < ActiveRecord::Migration
  def change
    create_table :enum_fields do |t|
      t.string :enum_text
      t.references :user_field

      t.timestamps
    end
    add_index :enum_fields, :user_field_id
  end
end
