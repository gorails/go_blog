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

ActiveRecord::Schema.define(version: 2017_12_05_121408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "teaser"
    t.text "body", null: false
    t.boolean "draft", default: false
    t.datetime "published_at"
    t.integer "user_id", null: false
    t.string "custom_url"
    t.integer "access_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_comments", force: :cascade do |t|
    t.integer "user_id"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.text "body"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comment_comments_on_commentable_type_and_commentable_id"
    t.index ["lft"], name: "index_comment_comments_on_lft"
    t.index ["parent_id"], name: "index_comment_comments_on_parent_id"
    t.index ["rgt"], name: "index_comment_comments_on_rgt"
  end

  create_table "users", force: :cascade do |t|
  end

end
