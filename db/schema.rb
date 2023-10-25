# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_025_131_537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comment_tables', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'post_id'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_comment_tables_on_author_id'
    t.index ['post_id'], name: 'index_comment_tables_on_post_id'
  end

  create_table 'like_tables', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_like_tables_on_author_id'
    t.index ['post_id'], name: 'index_like_tables_on_post_id'
  end

  create_table 'post_tables', force: :cascade do |t|
    t.bigint 'author_id'
    t.string 'title'
    t.text 'text'
    t.integer 'comments_counter'
    t.integer 'likes_counter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_post_tables_on_author_id'
  end

  create_table 'user_tables', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.text 'bio'
    t.integer 'posts_counter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'comment_tables', 'post_tables', column: 'post_id'
  add_foreign_key 'comment_tables', 'user_tables', column: 'author_id'
  add_foreign_key 'like_tables', 'post_tables', column: 'post_id'
  add_foreign_key 'like_tables', 'user_tables', column: 'author_id'
  add_foreign_key 'post_tables', 'user_tables', column: 'author_id'
end