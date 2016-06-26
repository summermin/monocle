# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160626204635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "causes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "causes", ["name"], name: "index_causes_on_name", unique: true, using: :btree

  create_table "checkin_days", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkin_days", ["name"], name: "index_checkin_days_on_name", unique: true, using: :btree

  create_table "checkins", force: :cascade do |t|
    t.string   "status"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "notified_at"
    t.datetime "responded_at"
  end

  add_index "checkins", ["project_id"], name: "index_checkins_on_project_id", using: :btree
  add_index "checkins", ["responded_at"], name: "index_checkins_on_responded_at", using: :btree
  add_index "checkins", ["status"], name: "index_checkins_on_status", using: :btree

  create_table "email_notification_methods", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_notification_methods", ["project_id"], name: "index_email_notification_methods_on_project_id", using: :btree

  create_table "notification_checkins", force: :cascade do |t|
    t.integer  "notification_id"
    t.integer  "checkin_id"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notification_checkins", ["checkin_id"], name: "index_notification_checkins_on_checkin_id", using: :btree
  add_index "notification_checkins", ["notification_id"], name: "index_notification_checkins_on_notification_id", using: :btree

  create_table "project_causes", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "cause_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_causes", ["project_id", "cause_id"], name: "index_project_causes_on_project_id_and_cause_id", unique: true, using: :btree

  create_table "project_checkin_days", force: :cascade do |t|
    t.integer "project_id"
    t.integer "checkin_day_id"
  end

  add_index "project_checkin_days", ["project_id", "checkin_day_id"], name: "index_project_checkin_days_on_project_id_and_checkin_day_id", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "project_type"
    t.integer  "checkin_hour"
  end

  add_index "projects", ["checkin_hour"], name: "index_projects_on_checkin_hour", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "sms_notification_methods", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sms_notification_methods", ["project_id"], name: "index_sms_notification_methods_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "checkins", "projects"
  add_foreign_key "projects", "users"
end
