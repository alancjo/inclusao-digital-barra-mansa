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

ActiveRecord::Schema[8.0].define(version: 2025_11_20_193856) do
  create_table "matches", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "mentor_id", null: false
    t.integer "score"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_matches_on_mentor_id"
    t.index ["student_id", "mentor_id"], name: "index_matches_on_student_id_and_mentor_id", unique: true
    t.index ["student_id"], name: "index_matches_on_student_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "expertise", null: false
    t.text "bio"
    t.string "availability"
    t.string "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "interests"
    t.text "learning_goal"
    t.string "availability"
    t.string "contact_info"
    t.string "proficiency_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supporters", force: :cascade do |t|
    t.string "name", null: false
    t.string "support_type"
    t.string "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "mentors"
  add_foreign_key "matches", "students"
end
