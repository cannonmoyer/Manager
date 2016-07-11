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

ActiveRecord::Schema.define(version: 20160711210432) do

  create_table "accounts", force: :cascade do |t|
    t.string   "line_number"
    t.string   "number"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "call_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.boolean  "burglary"
    t.boolean  "fire"
    t.boolean  "panic"
    t.boolean  "hold_up"
    t.string   "account_number"
    t.date     "start_date"
    t.date     "renewal_date"
    t.string   "to"
    t.string   "attention"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "customer_id"
  end

  add_index "certificates", ["customer_id"], name: "index_certificates_on_customer_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.string   "account_number"
    t.string   "phone_one"
    t.string   "phone_two"
    t.string   "phone_three"
    t.string   "phone_four"
    t.string   "fax"
    t.string   "email"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "forms", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.date     "date"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "special_job_instructions"
    t.text     "description"
    t.text     "work_completed"
    t.text     "billing_information"
    t.text     "notes"
    t.string   "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "time"
    t.boolean  "time_sensitive"
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "pages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "job_id"
    t.string   "name"
  end

  add_index "pages", ["job_id"], name: "index_pages_on_job_id"

  create_table "receipts", force: :cascade do |t|
    t.text     "information"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "job_id"
    t.string   "email"
  end

  add_index "receipts", ["job_id"], name: "index_receipts_on_job_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "level"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
