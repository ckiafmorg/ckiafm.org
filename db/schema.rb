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

ActiveRecord::Schema[7.0].define(version: 2022_11_18_032328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "diffusions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "diffuse_lundi"
    t.boolean "diffuse_mardi"
    t.boolean "diffuse_mercredi"
    t.boolean "diffuse_jeudi"
    t.boolean "diffuse_vendredi"
    t.boolean "diffuse_samedi"
    t.boolean "diffuse_dimanche"
    t.boolean "rediffusion"
    t.uuid "emission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "temps_debut", null: false
    t.time "temps_fin", null: false
    t.date "date_debut", null: false
    t.string "type"
    t.index ["emission_id"], name: "index_diffusions_on_emission_id"
  end

  create_table "emissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nom", null: false
    t.text "description", null: false
    t.integer "status", null: false
    t.string "email", null: false
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nom"], name: "index_emissions_on_nom", unique: true
    t.index ["slug"], name: "index_emissions_on_slug", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "diffusions", "emissions"
end
