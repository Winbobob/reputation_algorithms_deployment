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

ActiveRecord::Schema.define(version: 20150325134051) do

  create_table "reputations", force: true do |t|
    t.string   "user_alias_name",     limit: 255
    t.float    "score_by_reviewer",   limit: 24
    t.float    "score_by_author",     limit: 24
    t.float    "score_by_TA",         limit: 24
    t.float    "calibration_data",    limit: 24
    t.string   "text_matrics",        limit: 255
    t.float    "previous_reputation", limit: 24
    t.string   "other_data",          limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
