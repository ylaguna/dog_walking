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

ActiveRecord::Schema.define(version: 2019_05_10_044726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_walk_pets", force: :cascade do |t|
    t.bigint "dog_walk_id"
    t.string "name"
    t.integer "age"
    t.string "race"
    t.string "observation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_walk_id"], name: "index_dog_walk_pets_on_dog_walk_id"
  end

  create_table "dog_walks", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.datetime "scheduled_datetime"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.decimal "price", precision: 5, scale: 2
    t.float "latitude"
    t.float "longitude"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
