# frozen_string_literal: true

def log(msg)
  puts "Seed: #{msg}" # rubocop:disable Rails/Output
end

log 'Create users'
User.new(email: 'admin@ckiafm.org',
         password: '123456',
         password_confirmation: '123456',
         role: :admin)
    .save(validate: false)
User.new(email: 'user@ckiafm.org',
         password: '123456',
         password_confirmation: '123456')
    .save(validate: false)

log 'Create categories'
cat_actu = CategorieEmission.create(nom: 'Actualité', couleur: '#000000')
CategorieEmission.create(nom: 'Culture', couleur: '#FFFFFF')

log 'Create tags'
tag_qc = Tag.create(nom: 'Québec')
Tag.create(nom: 'Gentrification')
Tag.create(nom: 'Urbanisme')

log 'Create emissions'
emission_matin = Emission.new(nom: 'Québec Réveille',
                              description: "Quotidienne d'acutalité de la ville de Québec!",
                              email: 'quebecreveille@ckiafm.org',
                              status: :active,
                              categorie_emission_id: cat_actu.id)
emission_matin.users << User.first
emission_matin.tags << tag_qc
emission_matin.save

emission_soir = Emission.new(nom: "L'émission du retour",
                             description: "Quotidienne d'acutalité de fin de journée de la ville de Québec!",
                             email: 'retour@ckiafm.org',
                             status: :active,
                             categorie_emission_id: cat_actu.id)
emission_soir.users << User.first
emission_soir.tags << tag_qc
emission_soir.save

emission_weekend = Emission.new(nom: 'Les longues entresvues du weekend',
                                description: "Émission d'actualité de la fin de semaine composé de grandes entrevues.",
                                email: 'longueentrevues@ckiafm.org',
                                status: :active,
                                categorie_emission_id: cat_actu.id)
emission_weekend.users << User.first
emission_weekend.tags << tag_qc
emission_weekend.save

log 'Create diffusions'
DiffusionHebdomadaire.create(diffuse_lundi: true,
                             diffuse_mardi: true,
                             diffuse_mercredi: true,
                             diffuse_jeudi: true,
                             diffuse_vendredi: true,
                             emission_id: emission_matin.id,
                             temps_debut: Time.zone.parse('07:00'),
                             temps_fin: Time.zone.parse('09:00'),
                             date_debut: DateTime.parse('2024-01-21'))
DiffusionHebdomadaire.create(diffuse_lundi: true,
                             diffuse_mardi: true,
                             diffuse_mercredi: true,
                             diffuse_jeudi: true,
                             diffuse_vendredi: true,
                             emission_id: emission_soir.id,
                             temps_debut: Time.zone.parse('15:00'),
                             temps_fin: Time.zone.parse('17:00'),
                             date_debut: DateTime.parse('2024-01-21'))
DiffusionHebdomadaire.create(diffuse_samedi: true,
                             diffuse_dimanche: true,
                             emission_id: emission_weekend.id,
                             temps_debut: Time.zone.parse('09:30'),
                             temps_fin: Time.zone.parse('12:00'),
                             date_debut: DateTime.parse('2024-01-21'))
