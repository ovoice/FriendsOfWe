# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091115021442) do

  create_table "assets", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "state"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["assetable_id", "assetable_type"], :name => "index_assets_on_assetable_id_and_assetable_type"
  add_index "assets", ["id"], :name => "index_assets_on_id"

  create_table "commitments", :force => true do |t|
    t.string   "state"
    t.string   "name"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "opportunity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commitments", ["id"], :name => "index_commitments_on_id"
  add_index "commitments", ["opportunity_id"], :name => "index_commitments_on_opportunity_id"
  add_index "commitments", ["project_id"], :name => "index_commitments_on_project_id"
  add_index "commitments", ["state"], :name => "index_commitments_on_state"
  add_index "commitments", ["user_id"], :name => "index_commitments_on_user_id"

  create_table "opportunities", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opportunities", ["id"], :name => "index_opportunities_on_id"
  add_index "opportunities", ["project_id"], :name => "index_opportunities_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "activities"
    t.string   "status"
    t.string   "state"
    t.integer  "volunteer_count"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["featured"], :name => "index_projects_on_featured"
  add_index "projects", ["id"], :name => "index_projects_on_id"
  add_index "projects", ["state"], :name => "index_projects_on_state"
  add_index "projects", ["status"], :name => "index_projects_on_status"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["id"], :name => "index_taggings_on_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  add_index "tags", ["id"], :name => "index_tags_on_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.string   "state"
    t.boolean  "allow_contact"
    t.boolean  "allow_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_login_at"
    t.string   "last_login_ip"
  end

  add_index "users", ["allow_contact"], :name => "index_users_on_allow_contact"
  add_index "users", ["allow_email"], :name => "index_users_on_allow_email"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id"], :name => "index_users_on_id"
  add_index "users", ["state"], :name => "index_users_on_state"

end
