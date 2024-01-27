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

ActiveRecord::Schema[7.1].define(version: 2024_01_27_201743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categorie_emissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nom"
    t.string "couleur"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diffusions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "diffuse_lundi", default: false, null: false
    t.boolean "diffuse_mardi", default: false, null: false
    t.boolean "diffuse_mercredi", default: false, null: false
    t.boolean "diffuse_jeudi", default: false, null: false
    t.boolean "diffuse_vendredi", default: false, null: false
    t.boolean "diffuse_samedi", default: false, null: false
    t.boolean "diffuse_dimanche", default: false, null: false
    t.boolean "rediffusion", default: false, null: false
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
    t.uuid "categorie_emission_id"
    t.index ["nom"], name: "index_emissions_on_nom", unique: true
    t.index ["slug"], name: "index_emissions_on_slug", unique: true
  end

  create_table "emissions_users", id: false, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "emission_id", null: false
  end

  create_table "publicites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "liens", null: false
    t.date "date_debut", null: false
    t.date "date_fin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom", null: false
    t.string "format_id", null: false
    t.index ["nom"], name: "index_publicites_on_nom", unique: true
  end

  create_table "taggables", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "emission_id", null: false
    t.uuid "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emission_id"], name: "index_taggables_on_emission_id"
    t.index ["tag_id"], name: "index_taggables_on_tag_id"
  end

  create_table "tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nom"], name: "index_tags_on_nom", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "producer", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "diffusions", "emissions"
  add_foreign_key "emissions", "categorie_emissions"
  add_foreign_key "taggables", "emissions"
  add_foreign_key "taggables", "tags"
end
