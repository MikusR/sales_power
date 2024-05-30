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

ActiveRecord::Schema[7.0].define(version: 2024_05_30_112917) do
  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 50, default: "", null: false
    t.text "description", default: "", null: false
    t.boolean "visible", default: false, null: false
    t.index ["name"], name: "index_categories_on_name"
    t.index ["visible"], name: "index_categories_on_visible"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manager_id", null: false
    t.string "topic_type", null: false
    t.integer "topic_id", null: false
    t.text "content", default: "", null: false
    t.index ["manager_id"], name: "index_comments_on_manager_id"
    t.index ["topic_type", "topic_id"], name: "idx_comment_topic"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "first_name", limit: 50, default: "", null: false
    t.string "last_name", limit: 50, default: "", null: false
    t.integer "default_checkout_method", default: 0, null: false
    t.index ["default_checkout_method"], name: "index_customers_on_default_checkout_method"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "first_name", limit: 50, default: "", null: false
    t.string "last_name", limit: 50, default: "", null: false
    t.string "region", limit: 50, default: "", null: false
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "total", precision: 10, scale: 2, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["status"], name: "index_orders_on_status"
  end

  create_table "producers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "founding_year", default: 1965, null: false
    t.index ["name"], name: "index_producers_on_name", unique: true
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["product_id", "category_id"], name: "product_category_uniq_idx", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.integer "stock_quantity", default: 0, null: false
    t.string "sku", null: false
    t.integer "weight", null: false
    t.decimal "rating", precision: 2, scale: 1, null: false
    t.boolean "listed", default: false, null: false
    t.integer "producer_id", null: false
    t.index ["listed"], name: "index_products_on_listed"
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["price"], name: "index_products_on_price"
    t.index ["producer_id"], name: "index_products_on_producer_id"
    t.index ["rating"], name: "index_products_on_rating"
    t.index ["sku"], name: "index_products_on_sku", unique: true
    t.index ["stock_quantity"], name: "index_products_on_stock_quantity"
    t.index ["weight"], name: "index_products_on_weight"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.text "password_digest", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "managers"
  add_foreign_key "customers", "users"
  add_foreign_key "managers", "users"
  add_foreign_key "orders", "customers"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "products", "producers"
end
