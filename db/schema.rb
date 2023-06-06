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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_193849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.datetime "time", precision: nil
    t.date "date"
    t.string "note"
    t.integer "bucket_quantity"
    t.string "bucket_type"
    t.bigint "order_id", null: false
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["order_id"], name: "index_collections_on_order_id"
    t.index ["subscription_id"], name: "index_collections_on_subscription_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "stock_item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_item_id"], name: "index_orders_on_stock_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "pick_ups"
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collections", "orders"
  add_foreign_key "collections", "subscriptions"
  add_foreign_key "collections", "users"
  add_foreign_key "orders", "stock_items"
  add_foreign_key "orders", "users"
  add_foreign_key "subscriptions", "users"
end
