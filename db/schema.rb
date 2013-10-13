# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131012095139) do

  create_table "bug_extras", :force => true do |t|
    t.string "extra_fields"
    t.integer "bug_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bug_extras", ["bug_id"], :name => "index_bug_extras_on_bug_id"

  create_table "bug_histories", :force => true do |t|
    t.integer "bug_id"
    t.string "bug_field"
    t.string "old_value"
    t.string "new_value"
    t.integer "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bug_histories", ["bug_id"], :name => "index_bug_histories_on_bug_id"
  add_index "bug_histories", ["user_id"], :name => "index_bug_histories_on_user_id"

  create_table "bugs", :force => true do |t|
    t.string "summary"
    t.integer "status_id"
    t.integer "priority_id"
    t.integer "user_id"
    t.integer "owner"
    t.text "description"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bugs", ["priority_id"], :name => "index_bugs_on_priority_id"
  add_index "bugs", ["status_id"], :name => "index_bugs_on_status_id"
  add_index "bugs", ["user_id"], :name => "index_bugs_on_user_id"

  create_table "comments", :force => true do |t|
    t.string "model_name"
    t.integer "model_id"
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "enum_fields", :force => true do |t|
    t.string "enum_text"
    t.integer "user_field_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "enum_fields", ["user_field_id"], :name => "index_enum_fields_on_user_field_id"

  create_table "kindeditor_assets", :force => true do |t|
    t.string "asset"
    t.integer "file_size"
    t.string "file_type"
    t.integer "owner_id"
    t.string "asset_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "priorities", :force => true do |t|
    t.string "priority_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string "session_id", :null => false
    t.text "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "simple_captcha_data", :force => true do |t|
    t.string "key", :limit => 40
    t.string "value", :limit => 6
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "statuses", :force => true do |t|
    t.string "status_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer "previous_status_id"
  end

  create_table "user_fields", :force => true do |t|
    t.string "field_name"
    t.integer "field_type_id"
    t.boolean "required"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_fields", ["field_type_id"], :name => "index_user_fields_on_field_type_id"

  create_table "users", :force => true do |t|
    t.string "email", :default => "", :null => false
    t.string "encrypted_password", :default => "", :null => false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "username"
    t.boolean "admin", :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
