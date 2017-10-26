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

ActiveRecord::Schema.define(version: 20171026025915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nit"
    t.string "nombre"
    t.bigint "restaurante_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_clientes_on_restaurante_id"
  end

  create_table "detalle_pedidos", force: :cascade do |t|
    t.bigint "pedido_id"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cantidad"
    t.index ["menu_id"], name: "index_detalle_pedidos_on_menu_id"
    t.index ["pedido_id"], name: "index_detalle_pedidos_on_pedido_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.decimal "precio"
    t.bigint "restaurante_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_menus_on_restaurante_id"
  end

  create_table "mesas", force: :cascade do |t|
    t.integer "numero"
    t.bigint "restaurante_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurante_id"], name: "index_mesas_on_restaurante_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "numero"
    t.decimal "total"
    t.bigint "mesa_id"
    t.bigint "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estado", default: "SOLICITADO"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
    t.index ["mesa_id"], name: "index_pedidos_on_mesa_id"
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string "nit"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clientes", "restaurantes"
  add_foreign_key "detalle_pedidos", "pedidos"
  add_foreign_key "menus", "restaurantes"
  add_foreign_key "mesas", "restaurantes"
  add_foreign_key "pedidos", "mesas"
end
