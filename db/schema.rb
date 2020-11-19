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

ActiveRecord::Schema.define(version: 2020_11_19_222337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.index ["candidate_id"], name: "index_badges_on_candidate_id"
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "sq_candidate"
    t.string "nr_candidate"
    t.string "name_candidate"
    t.string "party_candidate"
    t.string "nr_party"
    t.string "total_patrimony"
    t.string "ds_coligation_composition"
    t.string "ds_nacionality"
    t.string "birth_dt"
    t.string "ds_gender"
    t.string "ds_marital_status"
    t.string "ds_color_race"
    t.string "ds_ocupation"
    t.text "militancy"
    t.string "acting_region"
    t.string "candidate_ballot_name"
    t.string "email_candidate"
    t.string "running_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "education"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_favorites_on_candidate_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "type"
    t.text "description"
    t.float "value"
    t.bigint "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_properties_on_candidate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "badges", "candidates"
  add_foreign_key "badges", "users"
  add_foreign_key "favorites", "candidates"
  add_foreign_key "favorites", "users"
  add_foreign_key "properties", "candidates"
end
