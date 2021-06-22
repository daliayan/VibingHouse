# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "house_id"
    t.index ["house_id"], name: "index_comments_on_house_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.integer "hex"
    t.float "price"
    t.integer "size"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "room_description"
    t.integer "windows"
    t.integer "house_id"
    t.integer "hex"
    t.integer "user_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "comments", "houses"
  add_foreign_key "comments", "users"
  add_foreign_key "rooms", "users"
end
