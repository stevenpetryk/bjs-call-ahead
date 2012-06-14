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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120614175428) do

  create_table "categories", :force => true do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "customers", :force => true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "phone"
    t.integer "zip"
  end

  create_table "favorites", :force => true do |t|
    t.integer "customer_id"
    t.integer "item_id"
  end

  add_index "favorites", ["customer_id"], :name => "index_favorites_on_customer_id"
  add_index "favorites", ["item_id"], :name => "index_favorites_on_item_id"

  create_table "items", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.float   "price"
    t.integer "category_id"
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"

  create_table "locations", :force => true do |t|
    t.string  "name"
    t.integer "zip"
    t.string  "phone"
    t.string  "street"
    t.string  "city"
    t.string  "state"
  end

  create_table "options", :force => true do |t|
    t.string  "name"
    t.string  "shortname"
    t.string  "option_type"
    t.integer "parent_id"
    t.integer "item_id"
  end

end
