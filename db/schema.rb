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

ActiveRecord::Schema[7.1].define(version: 2017_01_28_113043) do
  create_table "competitors", force: :cascade do |t|
    t.string "fio1"
    t.string "fio2"
    t.string "fio3"
    t.date "dob"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contest_id"
    t.string "location"
    t.string "organization"
    t.text "avatar_data"
    t.text "description"
    t.index ["contest_id"], name: "index_competitors_on_contest_id"
    t.index ["updated_at"], name: "index_competitors_on_updated_at"
    t.index ["user_id"], name: "index_competitors_on_user_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.text "cover_data"
    t.text "conditions"
    t.index ["updated_at"], name: "index_contests_on_updated_at"
  end

  create_table "criteria", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_criteria_on_contest_id"
    t.index ["updated_at"], name: "index_criteria_on_updated_at"
  end

  create_table "jurors", force: :cascade do |t|
    t.string "fio1"
    t.string "fio2"
    t.string "fio3"
    t.date "dob"
    t.string "location"
    t.integer "user_id"
    t.integer "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "organization"
    t.text "avatar_data"
    t.index ["contest_id"], name: "index_jurors_on_contest_id"
    t.index ["updated_at"], name: "index_jurors_on_updated_at"
    t.index ["user_id"], name: "index_jurors_on_user_id"
  end

  create_table "nominations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_nominations_on_contest_id"
    t.index ["updated_at"], name: "index_nominations_on_updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.date "obtained_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.integer "nomination_id"
    t.integer "competitor_id"
    t.integer "contest_id"
    t.index ["competitor_id"], name: "index_photos_on_competitor_id"
    t.index ["contest_id"], name: "index_photos_on_contest_id"
    t.index ["nomination_id"], name: "index_photos_on_nomination_id"
    t.index ["updated_at"], name: "index_photos_on_updated_at"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "juror_id"
    t.integer "photo_id"
    t.integer "criterion_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id", "juror_id", "criterion_id"], name: "index_ratings_on_photo_juror_criterion", unique: true
    t.index ["updated_at"], name: "index_ratings_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles_mask"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

end
