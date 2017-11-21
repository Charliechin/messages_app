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

ActiveRecord::Schema.define(version: 20171120235320) do

# Could not dump table "emails" because of following StandardError
#   Unknown type 'bool' for column 'in_quarantine'

  create_table "messages", force: :cascade do |t|
    t.string "sender"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "subject"
  end

  create_table "texts", force: :cascade do |t|
    t.integer "sender"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "expanded_body"
    t.text "header"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "sender"
    t.text "body"
    t.text "expanded_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hashtag"
    t.text "header"
    t.string "mentions"
  end

end
