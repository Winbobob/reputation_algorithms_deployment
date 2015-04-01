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

ActiveRecord::Schema.define(version: 20150401015438) do

  create_table "assignments", force: true do |t|
    t.integer "client_id", limit: 4
    t.integer "task_num",  limit: 4
  end

  add_index "assignments", ["client_id"], name: "fk_rails_b7d5ca267d", using: :btree

  create_table "clients", force: true do |t|
    t.string "client_name", limit: 255
  end

  create_table "reputations", force: true do |t|
    t.integer "task_id",          limit: 4
    t.float   "reputation_score", limit: 24
    t.float   "user_reputation",  limit: 24
  end

  add_index "reputations", ["task_id"], name: "fk_rails_44dd0bf9e4", using: :btree

  create_table "scores", force: true do |t|
    t.integer "reviewer_id",        limit: 4
    t.integer "reviewee_id",        limit: 4
    t.float   "peer_review_score",  limit: 24
    t.integer "peer_review_length", limit: 4
    t.string  "type",               limit: 255
  end

  add_index "scores", ["reviewee_id"], name: "fk_rails_2e2f3c7646", using: :btree
  add_index "scores", ["reviewer_id"], name: "fk_rails_fa5fcaa479", using: :btree

  create_table "tasks", force: true do |t|
    t.integer "assignment_id", limit: 4
    t.float   "PR_max_score",  limit: 24
    t.float   "PR_min_score",  limit: 24
    t.float   "BR_max_score",  limit: 24
    t.float   "BR_min_score",  limit: 24
  end

  add_index "tasks", ["assignment_id"], name: "fk_rails_e6e22983fc", using: :btree

  create_table "team_mappings", force: true do |t|
    t.integer "team_id", limit: 4
    t.integer "user_id", limit: 4
  end

  add_index "team_mappings", ["team_id"], name: "fk_rails_a957e70e0c", using: :btree
  add_index "team_mappings", ["user_id"], name: "fk_rails_dc1a46511e", using: :btree

  create_table "teams", force: true do |t|
    t.integer "client_id", limit: 4
  end

  add_index "teams", ["client_id"], name: "fk_rails_6155afefc5", using: :btree

  create_table "users", force: true do |t|
    t.integer "client_id", limit: 4
  end

  add_index "users", ["client_id"], name: "fk_rails_6f2dd4a672", using: :btree

  add_foreign_key "assignments", "clients"
  add_foreign_key "reputations", "tasks"
  add_foreign_key "scores", "teams", column: "reviewee_id"
  add_foreign_key "scores", "users", column: "reviewer_id"
  add_foreign_key "tasks", "assignments"
  add_foreign_key "team_mappings", "teams"
  add_foreign_key "team_mappings", "users"
  add_foreign_key "teams", "clients"
  add_foreign_key "users", "clients"
end
