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

ActiveRecord::Schema.define(version: 20150928220006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "story_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relationships", ["character_id"], name: "index_relationships_on_character_id", using: :btree
  add_index "relationships", ["story_id"], name: "index_relationships_on_story_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.text     "body"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stories", ["question_id"], name: "index_stories_on_question_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.integer  "concept_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topics", ["concept_id"], name: "index_topics_on_concept_id", using: :btree
  add_index "topics", ["story_id"], name: "index_topics_on_story_id", using: :btree

  add_foreign_key "relationships", "characters"
  add_foreign_key "relationships", "stories"
  add_foreign_key "stories", "questions"
  add_foreign_key "topics", "concepts"
  add_foreign_key "topics", "stories"
end
