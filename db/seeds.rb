# frozen_string_literal: true

def log(msg)
  puts "Seed: #{msg}" # rubocop:disable Rails/Output
end

log 'Create users'
User.new(email: 'test@ckiafm.org',
         password: '123456',
         password_confirmation: '123456')
    .save(validate: false)
User.new(email: 'user@ckiafm.org', password: 'abc123', password_confirmation: 'abc123').save(validate: false)

log 'Create categories'
cat_actu = CategorieEmission.create(nom: 'Actualité', couleur: '#000000')
CategorieEmission.create(nom: 'Culture', couleur: '#FFFFFF')

log 'Create tags'
tag_qc = Tag.create(nom: 'Québec')
Tag.create(nom: 'Gentrification')
Tag.create(nom: 'Urbanisme')

log 'Create emissions'
emission = Emission.new(nom: 'Québec Réveille',
                        description: "Quotidienne d'acutalité de la ville de Québec!",
                        email: 'quebecreveille@ckiafm.org',
                        status: Emission::STATUS[:active],
                        categorie_emission_id: cat_actu.id)
emission.users << User.first
emission.tags << tag_qc
emission.save

log 'Create diffusions'
DiffusionHebdomadaire.create(diffuse_lundi: true,
                             emission_id: Emission.first.id,
                             temps_debut: Time.zone.parse('09:00'),
                             temps_fin: Time.zone.parse('11:00'),
                             date_debut: DateTime.parse('2024-01-21'))
