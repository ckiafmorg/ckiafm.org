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

ActiveRecord::Schema[7.2].define(version: 2024_10_13_015532) do
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

  create_table "articles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titre", null: false
    t.string "slug"
    t.text "contenu", null: false
    t.date "published_at", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "balado_episodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titre", null: false
    t.string "slug"
    t.text "description", null: false
    t.text "transcript"
    t.datetime "published_at", null: false
    t.integer "status", default: 0, null: false
    t.string "audio_url"
    t.uuid "balado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_description", default: "", null: false
    t.index ["balado_id"], name: "index_balado_episodes_on_balado_id"
  end

  create_table "balados", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titre", null: false
    t.text "description", null: false
    t.datetime "published_at", null: false
    t.string "email", default: "", null: false
    t.string "website", default: "", null: false
    t.string "slug"
    t.integer "status", default: 0, null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["titre"], name: "index_balados_on_titre", unique: true
    t.index ["user_id"], name: "index_balados_on_user_id"
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
    t.date "date_debut", null: false
    t.string "type"
    t.string "temps_debut", default: "", null: false
    t.string "temps_fin", default: "", null: false
    t.index ["emission_id"], name: "index_diffusions_on_emission_id"
  end

  create_table "emission_episodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titre"
    t.datetime "published_at", null: false
    t.text "description"
    t.uuid "emission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emission_id"], name: "index_emission_episodes_on_emission_id"
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

  create_table "entree_feuille_routes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "vocal", default: 0, null: false
    t.integer "origine", default: 0, null: false
    t.integer "source", default: 0, null: false
    t.string "titre_piece", default: "", null: false
    t.string "temps_debut", default: "", null: false
    t.string "temps_fin", default: "", null: false
    t.uuid "emission_episode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emission_episode_id"], name: "index_entree_feuille_routes_on_emission_episode_id"
  end

  create_table "memberships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nom", null: false
    t.decimal "montant", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nom"], name: "index_memberships_on_nom", unique: true
  end

  create_table "membre_equipes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nom", null: false
    t.string "role", null: false
    t.uuid "emission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emission_id"], name: "index_membre_equipes_on_emission_id"
  end

  create_table "membres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "prenom", null: false
    t.string "nom", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "adresse", null: false
    t.string "code_postal", null: false
    t.string "ville", null: false
    t.string "province", null: false
    t.string "pays", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "membership_id"
    t.index ["email"], name: "index_membres_on_email", unique: true
  end

  create_table "paiements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "membre_id", null: false
    t.decimal "montant", precision: 8, scale: 2, null: false
    t.date "date_fin_actif", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membre_id"], name: "index_paiements_on_membre_id"
  end

  create_table "publicites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "liens", null: false
    t.date "date_debut", null: false
    t.date "date_fin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom", default: "", null: false
    t.string "format_id", default: "", null: false
    t.index ["nom"], name: "index_publicites_on_nom", unique: true
  end

  create_table "social_media_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "url", null: false
    t.integer "platform", null: false
    t.string "nom"
    t.string "has_social_media_account_type", null: false
    t.string "has_social_media_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["has_social_media_account_type", "has_social_media_account_id"], name: "index_social_media_accounts_on_has_social_media_account"
  end

  create_table "taggings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "taggable_type", null: false
    t.uuid "taggable_id", null: false
    t.uuid "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
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
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "balado_episodes", "balados"
  add_foreign_key "balados", "users"
  add_foreign_key "diffusions", "emissions"
  add_foreign_key "emission_episodes", "emissions"
  add_foreign_key "emissions", "categorie_emissions"
  add_foreign_key "entree_feuille_routes", "emission_episodes"
  add_foreign_key "membre_equipes", "emissions"
  add_foreign_key "membres", "memberships"
  add_foreign_key "paiements", "membres"
  add_foreign_key "taggings", "tags"
end
