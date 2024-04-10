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

ActiveRecord::Schema[7.0].define(version: 2024_04_08_163810) do
  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.integer "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_comments_on_feature_id"
  end

  create_table "earthquakes", force: :cascade do |t|
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.string "title", null: false
    t.string "mag_type", null: false
    t.boolean "tsunami"
    t.string "time"
    t.string "place", null: false
    t.decimal "magnitude"
    t.string "externa_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "earthquakes", column: "feature_id"
end
