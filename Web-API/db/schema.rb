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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140311190051) do

  create_table "licences", force: true do |t|
    t.string   "licence_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_types", force: true do |t|
    t.string   "resource_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.integer  "resource_type_id", null: false
    t.integer  "user_id",          null: false
    t.integer  "licence_id",       null: false
    t.string   "name",             null: false
    t.string   "description"
    t.string   "url",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["licence_id"], name: "index_resources_on_licence_id"
  add_index "resources", ["resource_type_id"], name: "index_resources_on_resource_type_id"
  add_index "resources", ["user_id"], name: "index_resources_on_user_id"

  create_table "tag_lists", force: true do |t|
    t.integer  "tag_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_lists", ["resource_id"], name: "index_tag_lists_on_resource_id"
  add_index "tag_lists", ["tag_id"], name: "index_tag_lists_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "tag",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname",       null: false
    t.string   "surname",         null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
