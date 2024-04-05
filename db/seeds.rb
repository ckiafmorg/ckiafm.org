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
                              description: "Émission d'affaires publiques traitant principalement des actualités politiques municipales, des activités citoyennes et communautaires et de la vie culturelle de la ville.",
                              email: 'matin@ckiafm.org',
                              status: :active,
                              categorie_emission_id: cat_actu.id)
emission_matin.users << User.last
emission_matin.tags << tag_qc
emission_matin.save
emission_matin.social_media_accounts.create(platform: :facebook, url: 'https://www.facebook.com/quebecreveille/')
emission_matin.social_media_accounts.create(platform: :youtube, url: 'https://www.youtube.com/channel/UCiin_6OBCUC-YizybZG85wg')
emission_matin.social_media_accounts.create(platform: :spotify, url: 'https://open.spotify.com/show/5mQuVSzEuATaTYNIl8sSp1')
emission_matin.social_media_accounts.create(platform: :podcast, nom: 'Apple Podcast', url: 'https://itunes.apple.com/ca/podcast/qu%C3%A9bec-r%C3%A9veille/id1305219732')
emission_matin.social_media_accounts.create(platform: :podcast, nom: 'Balado Québec', url: 'https://baladoquebec.ca/quebec-reveille')
emission_matin.diffusions.create(diffuse_lundi: true,
                                 diffuse_mardi: true,
                                 diffuse_mercredi: true,
                                 diffuse_jeudi: true,
                                 diffuse_vendredi: true,
                                 type: 'DiffusionHebdomadaire',
                                 temps_debut: Time.zone.parse('07:00'),
                                 temps_fin: Time.zone.parse('09:00'),
                                 date_debut: DateTime.parse('2024-01-21'))
emission_matin.diffusions.create(diffuse_lundi: true,
                                 diffuse_mardi: true,
                                 diffuse_mercredi: true,
                                 diffuse_jeudi: true,
                                 diffuse_vendredi: true,
                                 rediffusion: true,
                                 type: 'DiffusionHebdomadaire',
                                 temps_debut: Time.zone.parse('21:00'),
                                 temps_fin: Time.zone.parse('23:00'),
                                 date_debut: DateTime.parse('2024-01-21'))

emission_soir = Emission.new(nom: "L'émission du retour",
                             description: "Quotidienne d'acutalité de fin de journée de la ville de Québec!",
                             email: 'retour@ckiafm.org',
                             status: :active,
                             categorie_emission_id: cat_actu.id)
emission_soir.users << User.last
emission_soir.tags << tag_qc
emission_soir.save
emission_soir.diffusions.create(diffuse_lundi: true,
                                diffuse_mardi: true,
                                diffuse_mercredi: true,
                                diffuse_jeudi: true,
                                diffuse_vendredi: true,
                                type: 'DiffusionHebdomadaire',
                                temps_debut: Time.zone.parse('15:00'),
                                temps_fin: Time.zone.parse('17:00'),
                                date_debut: DateTime.parse('2024-01-21'))

emission_weekend = Emission.new(nom: 'Les longues entresvues du weekend',
                                description: "Émission d'actualité de la fin de semaine composé de grandes entrevues.",
                                email: 'longueentrevues@ckiafm.org',
                                status: :active,
                                categorie_emission_id: cat_actu.id)
emission_weekend.users << User.last
emission_weekend.tags << tag_qc
emission_weekend.save
emission_weekend.diffusions.create(diffuse_samedi: true,
                                   diffuse_dimanche: true,
                                   type: 'DiffusionHebdomadaire',
                                   temps_debut: Time.zone.parse('09:30'),
                                   temps_fin: Time.zone.parse('12:00'),
                                   date_debut: DateTime.parse('2024-01-21'))

log "Create articles"
Article.create(titre: "Un article de test", contenu: "## a test article\nUn peu de ontenu ici", published_at: "2024-03-01", status: 10)
