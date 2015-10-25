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

ActiveRecord::Schema.define(version: 20151024231311) do

  create_table "beer_descriptions", force: :cascade do |t|
    t.string   "language"
    t.string   "text"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "beer_descriptions", ["beer_id"], name: "index_beer_descriptions_on_beer_id"

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "bitter"
    t.integer  "body"
    t.integer  "sweet"
    t.datetime "edited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "article_id"
    t.string   "provider"
    t.string   "country"
    t.string   "alcohol"
    t.boolean  "ecological"
    t.boolean  "koscher"
  end

end
