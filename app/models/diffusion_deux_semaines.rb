# frozen_string_literal: true

class DiffusionDeuxSemaines < Diffusion
  def model_name
    Diffusion.model_name
  end

  def en_onde_aujourdhui?
    (Date.current.cweek - date_debut.cweek).even? && Date.current.wday == date_debut.wday
  end

  def jours_diffusion_formate
    # TODO: use translation here too
    "Tous les deux #{jour_de_la_semaine date_debut.wday}"
  end

  def type_diffusion
    'deux_semaines'
  end
end
