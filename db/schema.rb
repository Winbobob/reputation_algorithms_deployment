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
  end

  add_index "assignments", ["client_id"], name: "fk_rails_3578d28443", using: :btree

  create_table "clients", force: true do |t|
    t.string "client_name", limit: 255
  end

  create_table "entities", force: true do |t|
    t.integer "client_id", limit: 4
  end

  add_index "entities", ["client_id"], name: "fk_rails_8d8c29a854", using: :btree

  create_table "reputations", force: true do |t|
    t.integer "reviewer_id", limit: 4
    t.integer "task_id",     limit: 4
    t.float   "score",       limit: 24
  end

  add_index "reputations", ["reviewer_id"], name: "fk_rails_a953ec6acd", using: :btree
  add_index "reputations", ["task_id"], name: "fk_rails_722b2d85a4", using: :btree

  create_table "reviewed_entity_matrices", force: true do |t|
    t.integer "entity_id", limit: 4
    t.float   "score",     limit: 24
    t.string  "type",      limit: 255
  end

  add_index "reviewed_entity_matrices", ["entity_id"], name: "fk_rails_cf2a8c1b4c", using: :btree

  create_table "reviewers", force: true do |t|
    t.integer "client_id", limit: 4
  end

  add_index "reviewers", ["client_id"], name: "fk_rails_a41e7657a3", using: :btree

  create_table "score_matrices", force: true do |t|
    t.integer "reviewer_id", limit: 4
    t.integer "entity_id",   limit: 4
    t.integer "task_id",     limit: 4
    t.float   "score",       limit: 24
    t.string  "type",        limit: 255
  end

  add_index "score_matrices", ["entity_id"], name: "fk_rails_298fbb2196", using: :btree
  add_index "score_matrices", ["reviewer_id"], name: "fk_rails_4c45324ee0", using: :btree
  add_index "score_matrices", ["task_id"], name: "fk_rails_4059383e93", using: :btree

  create_table "tasks", force: true do |t|
    t.integer "assignment_id", limit: 4
    t.float   "PR_max_score",  limit: 24
    t.float   "PR_min_score",  limit: 24
    t.float   "BR_max_score",  limit: 24
    t.float   "BR_min_score",  limit: 24
  end

  add_index "tasks", ["assignment_id"], name: "fk_rails_0b0b8ef2bf", using: :btree

  add_foreign_key "assignments", "clients"
  add_foreign_key "entities", "clients"
  add_foreign_key "reputations", "reviewers"
  add_foreign_key "reputations", "tasks"
  add_foreign_key "reviewed_entity_matrices", "entities"
  add_foreign_key "reviewers", "clients"
  add_foreign_key "score_matrices", "entities"
  add_foreign_key "score_matrices", "reviewers"
  add_foreign_key "score_matrices", "tasks"
  add_foreign_key "tasks", "assignments"
end
