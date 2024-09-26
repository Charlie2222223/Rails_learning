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

ActiveRecord::Schema[7.0].define(version: 2024_09_26_055627) do
  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "departments_id"
    t.string "name"
    t.string "ruby"
    t.string "sex"
    t.string "tel"
    t.string "mobile"
    t.string "mail"
    t.string "zip"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.string "address5"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departments_id"], name: "index_users_on_departments_id"
  end

  create_table "users_skills", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "skills_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skills_id"], name: "index_users_skills_on_skills_id"
    t.index ["users_id"], name: "index_users_skills_on_users_id"
  end

  add_foreign_key "users", "departments", column: "departments_id"
  add_foreign_key "users_skills", "skills", column: "skills_id"
  add_foreign_key "users_skills", "users", column: "users_id"
end
