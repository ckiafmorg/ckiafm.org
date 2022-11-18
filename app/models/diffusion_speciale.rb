# frozen_string_literal: true

class DiffusionSpeciale < Diffusion
  def en_onde_aujourdhui?
    date_debut == Time.zone.today
  end

  def jours_diffusion_formate
    # TODO: use translation and localisatin here
    "Le #{jour_de_la_semaine date_debut.wday} #{date_debut}"
  end
end
