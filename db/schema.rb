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

ActiveRecord::Schema.define(version: 20160104105910) do

  create_table "billing_addresses", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.text     "address",    limit: 65535
    t.string   "country",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "pincode",    limit: 4
    t.integer  "mobile",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
    t.integer  "country_id", limit: 4
  end

  add_index "billing_addresses", ["country_id"], name: "index_billing_addresses_on_country_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.integer  "store_sub_category_id", limit: 4
    t.integer  "sub_device_id",         limit: 4
    t.boolean  "is_active",                         default: true
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "store_category_id",     limit: 4
  end

  add_index "brands", ["store_category_id"], name: "index_brands_on_store_category_id", using: :btree
  add_index "brands", ["store_sub_category_id"], name: "fk_rails_4d5743b44d", using: :btree
  add_index "brands", ["sub_device_id"], name: "fk_rails_96b8c3bde8", using: :btree

  create_table "case_types", force: :cascade do |t|
    t.integer  "case_id",       limit: 4
    t.string   "name",          limit: 255
    t.string   "image",         limit: 255
    t.string   "product_image", limit: 255
    t.boolean  "active",                    default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "case_types", ["case_id"], name: "index_case_types_on_case_id", using: :btree

  create_table "cases", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.integer  "sub_device_id",         limit: 4
    t.string   "image",                 limit: 255
    t.text     "description",           limit: 65535
    t.string   "layout_id",             limit: 255
    t.boolean  "is_active",                           default: true
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.text     "long_description",      limit: 65535
    t.integer  "device_id",             limit: 4
    t.string   "product_image",         limit: 255
    t.string   "product_image_overlay", limit: 255
  end

  add_index "cases", ["device_id"], name: "index_cases_on_device_id", using: :btree
  add_index "cases", ["sub_device_id"], name: "index_cases_on_sub_device_id", using: :btree

  create_table "cases_layouts", id: false, force: :cascade do |t|
    t.integer "case_id",   limit: 4
    t.integer "layout_id", limit: 4
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "device_image", limit: 255
  end

  create_table "faq_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_active",              default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.integer  "faq_category_id", limit: 4
    t.text     "question",        limit: 65535
    t.text     "answer",          limit: 65535
    t.boolean  "is_active",                     default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "faqs", ["faq_category_id"], name: "index_faqs_on_faq_category_id", using: :btree

  create_table "home_sliders", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.string   "title",      limit: 255
    t.string   "subtitle",   limit: 255
    t.string   "link",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "layouts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.boolean  "is_active"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "device_id",  limit: 4
  end

  add_index "layouts", ["device_id"], name: "index_layouts_on_device_id", using: :btree

  create_table "make_mobile_pages", force: :cascade do |t|
    t.string   "title",                 limit: 255
    t.string   "app_icon",              limit: 255
    t.string   "dowanload_button_text", limit: 255
    t.string   "background",            limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_colors", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "code",                  limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "store_sub_category_id", limit: 4
    t.integer  "store_category_id",     limit: 4
  end

  add_index "product_colors", ["store_category_id"], name: "index_product_colors_on_store_category_id", using: :btree
  add_index "product_colors", ["store_sub_category_id"], name: "index_product_colors_on_store_sub_category_id", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "product_id", limit: 4
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "product_variations", force: :cascade do |t|
    t.string   "image",            limit: 255
    t.integer  "product_id",       limit: 4
    t.integer  "product_color_id", limit: 4
    t.boolean  "active",                       default: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "product_variations", ["product_color_id"], name: "index_product_variations_on_product_color_id", using: :btree
  add_index "product_variations", ["product_id"], name: "index_product_variations_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.integer  "user_id",               limit: 4
    t.integer  "store_sub_category_id", limit: 4
    t.integer  "sub_device_id",         limit: 4
    t.integer  "case_id",               limit: 4
    t.integer  "layout_id",             limit: 4
    t.integer  "brand_id",              limit: 4
    t.float    "price",                 limit: 24
    t.text     "description",           limit: 65535
    t.boolean  "is_active",                           default: true
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "tag",                   limit: 255
    t.integer  "device_id",             limit: 4
    t.integer  "store_category_id",     limit: 4
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["case_id"], name: "index_products_on_case_id", using: :btree
  add_index "products", ["device_id"], name: "index_products_on_device_id", using: :btree
  add_index "products", ["layout_id"], name: "index_products_on_layout_id", using: :btree
  add_index "products", ["store_category_id"], name: "index_products_on_store_category_id", using: :btree
  add_index "products", ["store_sub_category_id"], name: "index_products_on_store_sub_category_id", using: :btree
  add_index "products", ["sub_device_id"], name: "index_products_on_sub_device_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.string   "country",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "pincode",    limit: 4
    t.integer  "mobile",     limit: 8
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "country_id", limit: 4
  end

  add_index "shipping_addresses", ["country_id"], name: "index_shipping_addresses_on_country_id", using: :btree
  add_index "shipping_addresses", ["user_id"], name: "index_shipping_addresses_on_user_id", using: :btree

  create_table "stamp_images", force: :cascade do |t|
    t.integer  "stamp_id",   limit: 4
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stamp_images", ["stamp_id"], name: "index_stamp_images_on_stamp_id", using: :btree

  create_table "stamps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "store_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_active",              default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "store_sub_categories", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "store_category_id", limit: 4
    t.boolean  "is_active",                     default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "store_sub_categories", ["store_category_id"], name: "index_store_sub_categories_on_store_category_id", using: :btree

  create_table "sub_devices", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "device_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.float    "price",            limit: 24
    t.string   "sub_device_image", limit: 255
  end

  add_index "sub_devices", ["device_id"], name: "index_sub_devices_on_device_id", using: :btree

  create_table "supports", force: :cascade do |t|
    t.string   "page_name",  limit: 255
    t.text     "content",    limit: 65535
    t.text     "extra",      limit: 65535
    t.boolean  "is_active",                default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "user_meta", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "currency",   limit: 255
  end

  add_index "user_meta", ["user_id"], name: "index_user_meta_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.boolean  "admin",                              default: false
    t.string   "email2",                 limit: 255
    t.string   "referral_code",          limit: 255
    t.integer  "affiliate_id",           limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "product_id",           limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "product_variation_id", limit: 4
  end

  add_index "wishlists", ["product_id"], name: "index_wishlists_on_product_id", using: :btree
  add_index "wishlists", ["product_variation_id"], name: "index_wishlists_on_product_variation_id", using: :btree
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id", using: :btree

  add_foreign_key "billing_addresses", "countries"
  add_foreign_key "brands", "store_categories"
  add_foreign_key "brands", "store_sub_categories"
  add_foreign_key "brands", "sub_devices"
  add_foreign_key "case_types", "cases"
  add_foreign_key "cases", "devices"
  add_foreign_key "layouts", "devices"
  add_foreign_key "product_colors", "store_categories"
  add_foreign_key "product_colors", "store_sub_categories"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_variations", "product_colors"
  add_foreign_key "product_variations", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "cases"
  add_foreign_key "products", "devices"
  add_foreign_key "products", "layouts"
  add_foreign_key "products", "store_categories"
  add_foreign_key "products", "store_sub_categories"
  add_foreign_key "products", "sub_devices"
  add_foreign_key "products", "users"
  add_foreign_key "shipping_addresses", "countries"
  add_foreign_key "shipping_addresses", "users"
  add_foreign_key "stamp_images", "stamps"
  add_foreign_key "store_sub_categories", "store_categories"
  add_foreign_key "sub_devices", "devices"
  add_foreign_key "user_meta", "users"
  add_foreign_key "wishlists", "product_variations"
  add_foreign_key "wishlists", "products"
  add_foreign_key "wishlists", "users"
end
