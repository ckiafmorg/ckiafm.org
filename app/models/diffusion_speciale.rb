# frozen_string_literal: true

class DiffusionSpeciale < Diffusion
  # This is to make the form model: record work correctly
  # Find a way to move this into Diffusion for all subclass of Diffusion
  def model_name
    Diffusion.model_name
  end

  def en_onde_aujourdhui?
    date_debut == Time.zone.today
  end

  def jours_diffusion_formate
    # TODO: use translation and localisatin here
    # TODO, we should probably handle this kind of stuff in a view partial
    "Le #{jour_de_la_semaine date_debut.wday} #{date_debut}"
  end

  # this is to make the form work properly
  def type_diffusion
    'speciale'
  end
end
