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

ActiveRecord::Schema[7.0].define(version: 2022_11_06_634261) do
  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "price"
    t.integer "number"
    t.boolean "neededItem"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "phone"
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
  end

end
