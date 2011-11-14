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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111111192056) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "answer"
    t.integer  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "news_id"
    t.integer  "player_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.integer  "player_id"
    t.text     "intro"
    t.text     "body"
    t.string   "cached_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name",                   :limit => 40
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "skin"
    t.integer  "kp",                                    :default => 0
    t.integer  "cash",                                  :default => 500
    t.integer  "bank",                                  :default => 1000
    t.integer  "job",                                   :default => 0
    t.integer  "job_level",                             :default => 0
    t.integer  "organization",                          :default => 0
    t.integer  "rank",                                  :default => 0
    t.integer  "player_level",                          :default => 1
    t.string   "skype"
    t.integer  "gadu"
    t.text     "signature",              :limit => 120
    t.integer  "hours",                                 :default => 0
    t.integer  "minutes",                               :default => 0
    t.integer  "warns",                                 :default => 0
    t.integer  "sex"
    t.string   "email"
    t.integer  "active",                                :default => 0
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

end
