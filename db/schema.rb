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

ActiveRecord::Schema.define(version: 0) do

  create_table "assignment", force: true do |t|
    t.integer "client_id", limit: 4, null: false
    t.integer "task_num",  limit: 4, null: false
  end

  add_index "assignment", ["client_id"], name: "client_id", using: :btree

  create_table "client", force: true do |t|
    t.string "client_name", limit: 255, null: false
  end

  create_table "reputation", force: true do |t|
    t.integer "task_id",          limit: 4,  null: false
    t.float   "reputation_score", limit: 24, null: false
    t.float   "user_reputation",  limit: 24, null: false
  end

  add_index "reputation", ["task_id"], name: "task_id", using: :btree

  create_table "score", force: true do |t|
    t.integer "reviewer_id",        limit: 4,  null: false
    t.integer "reviewee_id",        limit: 4,  null: false
    t.float   "peer_review_score",  limit: 24, null: false
    t.integer "peer_review_length", limit: 4,  null: false
    t.string  "type",               limit: 2,  null: false
  end

  add_index "score", ["reviewee_id"], name: "reviewee_id", using: :btree
  add_index "score", ["reviewer_id"], name: "reviewer_id", using: :btree

  create_table "task", force: true do |t|
    t.integer "assignment_id", limit: 4,  null: false
    t.float   "PR_max_score",  limit: 24, null: false
    t.float   "PR_min_score",  limit: 24, null: false
    t.float   "BR_max_score",  limit: 24, null: false
    t.float   "BR_min_score",  limit: 24, null: false
  end

  add_index "task", ["assignment_id"], name: "assignment_id", using: :btree

  create_table "team", force: true do |t|
    t.integer "client_id", limit: 4, null: false
  end

  add_index "team", ["client_id"], name: "client_id", using: :btree

  create_table "team_mapping", force: true do |t|
    t.integer "team_id", limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
  end

  add_index "team_mapping", ["team_id"], name: "team_id", using: :btree
  add_index "team_mapping", ["user_id"], name: "user_id", using: :btree

  create_table "user", force: true do |t|
    t.integer "client_id", limit: 4, null: false
  end

  add_index "user", ["client_id"], name: "client_id", using: :btree

  add_foreign_key "assignment", "client", name: "assignment_ibfk_1"
  add_foreign_key "reputation", "task", name: "reputation_ibfk_1"
  add_foreign_key "score", "team", column: "reviewee_id", name: "score_ibfk_2"
  add_foreign_key "score", "user", column: "reviewer_id", name: "score_ibfk_1"
  add_foreign_key "task", "assignment", name: "task_ibfk_1"
  add_foreign_key "team", "client", name: "team_ibfk_1"
  add_foreign_key "team_mapping", "team", name: "team_mapping_ibfk_1"
  add_foreign_key "team_mapping", "user", name: "team_mapping_ibfk_2"
  add_foreign_key "user", "client", name: "user_ibfk_1"
end
