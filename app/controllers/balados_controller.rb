# frozen_string_literal: true

class BaladosController < ApplicationController
  def index
    @balados = Balado.published.live.includes(:episodes)
  end

  def show
    @balado = Balado.includes(:episodes).find(params[:id])
    @latest_episode = @balado.episodes.last
    @other_episodes = @balado.episodes[1..] || []
  end
end
