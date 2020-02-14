# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_14_094112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "details", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "confirm_movie_name"
    t.string "confirm_theatre_name"
    t.integer "no_of_seats"
    t.string "show_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "moviestheatre_id", null: false
    t.index ["moviestheatre_id"], name: "index_details_on_moviestheatre_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moviestheatres", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "theatre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "morning_show_count"
    t.integer "matinee_show_count"
    t.integer "evening_show_count"
    t.integer "night_show_count"
    t.index ["movie_id"], name: "index_moviestheatres_on_movie_id"
    t.index ["theatre_id"], name: "index_moviestheatres_on_theatre_id"
  end

  create_table "theatres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "seat_count"
  end

  create_table "theatreshows", force: :cascade do |t|
    t.string "name"
    t.time "time"
    t.bigint "theatre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theatre_id"], name: "index_theatreshows_on_theatre_id"
  end

  add_foreign_key "details", "moviestheatres"
  add_foreign_key "moviestheatres", "movies"
  add_foreign_key "moviestheatres", "theatres"
  add_foreign_key "theatreshows", "theatres"
end
