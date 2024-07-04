# frozen_string_literal: true

module Admin
  class BaladoEpisodesController < AdminController
    def show
      @episode = BaladoEpisode.find(params[:id])
    end

    def new
      @balado = Balado.find(params[:balado_id])
      @episode = BaladoEpisode.new
    end

    def edit
      @balado = Balado.find(params[:balado_id])
      @episode = BaladoEpisode.find(params[:id])
    end

    def create
      @balado = Balado.find(params[:balado_id])
      if @balado.episodes.create(episode_params)
        redirect_to admin_balado_path(@balado), notice: t('admin.balado_episodes.created_successfully')
      else
        render :new
      end
    end

    def update
      @balado = Balado.find(params[:balado_id])
      @episode = BaladoEpisode.find(params[:id])

      if @episode.update(episode_params)
        redirect_to admin_balado_path(@balado), notice: t('admin.balado_episodes.updated_successfully')
      else
        render :edit
      end
    end

    private

    def episode_params
      params.require(:balado_episode).permit(:titre, :description, :transcript, :published_at, :status, :audio_url)
    end
  end
end
