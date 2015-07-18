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

ActiveRecord::Schema.define(version: 20150717113144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string   "title"
    t.integer  "width"
    t.integer  "height"
    t.string   "jtg"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "artist_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "artworks", ["artist_id"], name: "index_artworks_on_artist_id", using: :btree

  create_table "artworks_keywords", id: false, force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "keyword_id", null: false
  end

  add_index "artworks_keywords", ["artwork_id"], name: "index_artworks_keywords_on_artwork_id", using: :btree
  add_index "artworks_keywords", ["keyword_id"], name: "index_artworks_keywords_on_keyword_id", using: :btree

  create_table "artworks_locations", id: false, force: :cascade do |t|
    t.integer "artwork_id",  null: false
    t.integer "location_id", null: false
  end

  add_index "artworks_locations", ["artwork_id"], name: "index_artworks_locations_on_artwork_id", using: :btree
  add_index "artworks_locations", ["location_id"], name: "index_artworks_locations_on_location_id", using: :btree

  create_table "artworks_media", id: false, force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "medium_id",  null: false
  end

  add_index "artworks_media", ["artwork_id"], name: "index_artworks_media_on_artwork_id", using: :btree
  add_index "artworks_media", ["medium_id"], name: "index_artworks_media_on_medium_id", using: :btree

  create_table "artworks_styles", id: false, force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "style_id",   null: false
  end

  add_index "artworks_styles", ["artwork_id"], name: "index_artworks_styles_on_artwork_id", using: :btree
  add_index "artworks_styles", ["style_id"], name: "index_artworks_styles_on_style_id", using: :btree

  create_table "artworks_subjects", id: false, force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "subject_id", null: false
  end

  add_index "artworks_subjects", ["artwork_id"], name: "index_artworks_subjects_on_artwork_id", using: :btree
  add_index "artworks_subjects", ["subject_id"], name: "index_artworks_subjects_on_subject_id", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
