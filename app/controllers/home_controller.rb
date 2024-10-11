# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @current_emission = Diffusion.find_diffusion_en_cours&.first&.emission
    @latest_balado_episode = BaladoEpisode.published.live.includes(:balado).last
  end
end
