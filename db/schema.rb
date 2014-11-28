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

ActiveRecord::Schema.define(version: 20141124233057) do

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id"

  create_table "authors", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",          precision: 12, scale: 4
    t.integer  "count_in_stock"
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", force: true do |t|
    t.string   "number"
    t.integer  "cvv"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_cards", ["customer_id"], name: "index_credit_cards_on_customer_id"

  create_table "customers", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.decimal  "price",      precision: 12, scale: 4
    t.integer  "quantity"
    t.integer  "book_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.decimal  "total_price",         precision: 12, scale: 4, default: 0.0
    t.datetime "completed_at"
    t.integer  "state",                                        default: 0
    t.integer  "customer_id"
    t.integer  "credit_card_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id"
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "ratings", id: false, force: true do |t|
    t.text     "text"
    t.integer  "rating"
    t.integer  "customer_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id"
  add_index "ratings", ["customer_id", "book_id"], name: "index_ratings_on_customer_id_and_book_id"
  add_index "ratings", ["customer_id"], name: "index_ratings_on_customer_id"

end
