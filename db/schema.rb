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

ActiveRecord::Schema.define(version: 20170116083200) do

  create_table "competitors", force: :cascade do |t|
    t.string   "fio1"
    t.string   "fio2"
    t.string   "fio3"
    t.date     "dob"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contest_id"
    t.index ["contest_id"], name: "index_competitors_on_contest_id"
    t.index ["user_id"], name: "index_competitors_on_user_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "state"
  end

  create_table "criteria", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "contest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contest_id"], name: "index_criteria_on_contest_id"
  end

  create_table "jurors", force: :cascade do |t|
    t.string   "fio1"
    t.string   "fio2"
    t.string   "fio3"
    t.date     "dob"
    t.string   "location"
    t.integer  "user_id"
    t.integer  "contest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.index ["contest_id"], name: "index_jurors_on_contest_id"
    t.index ["user_id"], name: "index_jurors_on_user_id"
  end

  create_table "nominations", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "contest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contest_id"], name: "index_nominations_on_contest_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.date     "obtained_at"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "image_data"
    t.integer  "nomination_id"
    t.integer  "competitor_id"
    t.index ["competitor_id"], name: "index_photos_on_competitor_id"
    t.index ["nomination_id"], name: "index_photos_on_nomination_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "roles_mask"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
