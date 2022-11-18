# frozen_string_literal: true

class DiffusionMensuelle < Diffusion
  def en_onde_aujourdhui?
    return false unless same_month_week?

    date_debut.wday == Date.current.wday
  end

  def jours_diffusion_formate
    # TODO: use translation and localisation here too
    "Tous les #{month_week date_debut}e #{jour_de_la_semaine date_debut.wday} du mois"
  end

  private

  def same_month_week?
    date_debut_month_week = month_week(date_debut)
    current_date_month_week = month_week(Date.current)

    current_date_month_week + 1 if Date.current.beginning_of_month.wday < date_debut.wday

    date_debut_month_week == current_date_month_week
  end

  def month_week(date)
    (date.cweek - date.beginning_of_month.cweek) + 1 # week start at one and not zero
  end
end
