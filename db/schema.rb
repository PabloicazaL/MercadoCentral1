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

ActiveRecord::Schema.define(version: 20161108231136) do

  create_table "comidas", force: :cascade do |t|
    t.string   "tipo_comida"
    t.string   "tipo_cocina"
    t.integer  "porciones"
    t.string   "comida_nombre"
    t.text     "resumen"
    t.boolean  "es_alergia_habas"
    t.boolean  "es_alergia_habas_soya"
    t.boolean  "es_alergia_nueces"
    t.boolean  "es_alergia_huevos"
    t.boolean  "es_alergia_mariscos"
    t.boolean  "es_alergia_gluten"
    t.boolean  "es_alergia_pescado"
    t.boolean  "es_alergia_sesamo"
    t.boolean  "es_diabetes"
    t.boolean  "es_halal"
    t.boolean  "es_intolerante_lactosa"
    t.boolean  "es_kosher"
    t.boolean  "es_nocerdo"
    t.boolean  "es_organica"
    t.boolean  "es_singluten"
    t.boolean  "es_vegana"
    t.boolean  "es_vegetariana"
    t.integer  "precio"
    t.integer  "tiempo_anticipacion"
    t.boolean  "es_servicio_domicilio"
    t.integer  "rango"
    t.string   "direccion"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "comidas", ["user_id"], name: "index_comidas_on_user_id"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "pedidos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comida_id"
    t.datetime "fecha_pedido"
    t.integer  "precio"
    t.integer  "total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "hora"
    t.integer  "cantidad"
  end

  add_index "pedidos", ["comida_id"], name: "index_pedidos_on_comida_id"
  add_index "pedidos", ["user_id"], name: "index_pedidos_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "comida_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["comida_id"], name: "index_photos_on_comida_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star"
    t.integer  "comida_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["comida_id"], name: "index_reviews_on_comida_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
