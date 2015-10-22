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

ActiveRecord::Schema.define(version: 20150928043421) do

  create_table "action_item_histories", force: true do |t|
    t.integer  "action_item_id",    null: false
    t.integer  "operation_user_id", null: false
    t.integer  "operation",         null: false
    t.datetime "date",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_items", force: true do |t|
    t.integer  "agenda_id",                            null: false
    t.integer  "user_id",                              null: false
    t.string   "content",                 limit: 1024, null: false
    t.date     "scheduled_date",                       null: false
    t.date     "completion_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cybozu_schedule_id"
    t.integer  "cybozu_schedule_version"
  end

  create_table "admin_settings", force: true do |t|
    t.boolean  "enable_cybozu", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agenda_templates", force: true do |t|
    t.integer  "kind_id",                 null: false
    t.string   "content",    limit: 1024, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agendas", force: true do |t|
    t.integer  "proceeding_id", null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_histories", force: true do |t|
    t.integer  "comment_id",        null: false
    t.integer  "operation_user_id", null: false
    t.integer  "operation",         null: false
    t.datetime "date",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "proceeding_id", null: false
    t.integer  "user_id",       null: false
    t.string   "content",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cybozus", force: true do |t|
    t.string   "url",        null: false
    t.string   "login_id",   null: false
    t.string   "password",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kinds", force: true do |t|
    t.string   "name",                       null: false
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.integer  "meeting_id", null: false
    t.string   "annotation", null: false
    t.string   "path",       null: false
    t.string   "file_name",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["path", "file_name"], name: "index_materials_on_path_and_file_name", unique: true, using: :btree

  create_table "meeting_histories", force: true do |t|
    t.integer  "meeting_id",        null: false
    t.integer  "operation_user_id", null: false
    t.integer  "operation",         null: false
    t.datetime "date",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", force: true do |t|
    t.string   "name",                                                null: false
    t.integer  "kind_id",                                             null: false
    t.integer  "related_meeting_id"
    t.date     "dates",                                               null: false
    t.time     "start_time",                                          null: false
    t.integer  "scheduled_time_id"
    t.string   "venue",                                               null: false
    t.string   "message",                 limit: 500, default: ""
    t.integer  "lock_version",                        default: 0
    t.boolean  "is_holding",                          default: false
    t.boolean  "is_canceled",                         default: false
    t.boolean  "is_completed",                        default: false
    t.integer  "cybozu_schedule_id"
    t.integer  "cybozu_schedule_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approver_id"
    t.text     "unregistered_guest"
  end

  create_table "observer_templates", force: true do |t|
    t.integer  "kind_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observers", force: true do |t|
    t.integer  "meeting_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_templates", force: true do |t|
    t.integer  "kind_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.integer  "meeting_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proceedings", force: true do |t|
    t.integer  "meeting_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scheduled_times", force: true do |t|
    t.time     "time",                       null: false
    t.integer  "kind",                       null: false
    t.boolean  "short",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scheduled_times", ["time", "kind"], name: "index_scheduled_times_on_time_and_kind", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "login_id",        limit: 100,                 null: false
    t.string   "name",            limit: 100,                 null: false
    t.string   "kana",            limit: 200
    t.string   "mailaddress",     limit: 256
    t.string   "password_digest",                             null: false
    t.integer  "cybozu_id"
    t.integer  "grant",                                       null: false
    t.string   "remember_token"
    t.boolean  "is_deleted",                  default: false
    t.boolean  "is_firstlogged",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["kana"], name: "index_users_on_kana", using: :btree
  add_index "users", ["login_id"], name: "index_users_on_login_id", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "viewers", force: true do |t|
    t.integer  "comment_id",                   null: false
    t.integer  "user_id",                      null: false
    t.boolean  "is_confirmed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
