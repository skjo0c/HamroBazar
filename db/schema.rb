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

ActiveRecord::Schema.define(version: 20171219085904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adphotos", force: :cascade do |t|
    t.integer  "advertisement_id"
    t.string   "picture"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["advertisement_id"], name: "index_adphotos_on_advertisement_id", using: :btree
  end

  create_table "advertisements", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
  end

  create_table "advertisements_categories", id: false, force: :cascade do |t|
    t.integer "advertisement_id", null: false
    t.integer "category_id",      null: false
    t.index ["advertisement_id", "category_id"], name: "ad_cat", using: :btree
    t.index ["category_id", "advertisement_id"], name: "cat_ad", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "advertisement_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname",                       null: false
    t.string   "lastname",                        null: false
    t.string   "email",                           null: false
    t.string   "mobile",                          null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "picture"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_foreign_key "adphotos", "advertisements"
end
