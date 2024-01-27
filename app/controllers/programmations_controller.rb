# frozen_string_literal: true

class ProgrammationsController < ApplicationController
  def show
    @diffusions = Diffusion.order(temps_debut: :asc).filter(&:en_onde_aujourdhui?)
  end
end
