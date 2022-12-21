# frozen_string_literal: true

class DiffusionHebdomadaire < Diffusion
  def model_name
    Diffusion.model_name
  end

  def en_onde_aujourdhui?
    Date.current >= date_debut && jours_diffusion[Date.current.wday]
  end

  def jours_diffusion_formate
    # Ce n'est pas super, mais ça évite de faire une table juste pour les jours
    # de la semaine. L'autre solution serait de faire un enum, de permettre le
    # multiselect et sauvegarder les jours dans un seuls champ de la table avec
    # un séparateur.
    jours = []
    jours << 'lundi' if diffuse_lundi
    jours << 'mardi' if diffuse_mardi
    jours << 'mercredi' if diffuse_mercredi
    jours << 'jeudi' if diffuse_jeudi
    jours << 'vendredi' if diffuse_vendredi
    jours << 'samedi' if diffuse_samedi
    jours << 'dimanche' if diffuse_dimanche

    jours.to_sentence(last_word_connector: ' et ', two_words_connector: ' et ')
  end

  def type_diffusion
    'hebdomadaire'
  end
end
