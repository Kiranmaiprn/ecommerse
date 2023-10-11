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

ActiveRecord::Schema[7.0].define(version: 2023_09_07_041801) do
  create_table "accounts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_number"
    t.string "account_type"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "picode"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.integer "users_id"
    t.index ["order_id"], name: "index_comments_on_order_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.string "item_name"
    t.index ["cart_id"], name: "index_items_on_cart_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.integer "recipient_id", null: false
    t.string "type", null: false
    t.json "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "orderdetails", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_orderdetails_on_item_id"
    t.index ["order_id"], name: "index_orderdetails_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_number"
    t.string "payment_type"
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "carts", "users"
  add_foreign_key "comments", "orders"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "items", "carts"
  add_foreign_key "orderdetails", "items"
  add_foreign_key "orderdetails", "orders"
  add_foreign_key "orders", "users"
end
