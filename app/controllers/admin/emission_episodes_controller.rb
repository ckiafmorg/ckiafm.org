# frozen_string_literal: true

module Admin
  class EmissionEpisodesController < AdminController
    def new
      @emission = Emission.find(params[:emission_id])
      @episode = EmissionEpisode.new
      @episode.entrees.build
    end

    def edit
      @emission = Emission.find(params[:emission_id])
      @episode = EmissionEpisode.find(params[:id])
      @episode.entrees.build
    end

    def create
      @emission = Emission.find(params[:emission_id])

      if @emission.episodes.create(emission_episode_params)
        redirect_to admin_emission_path(@emission), notice: t('admin.emission_episodes.created_successfully')
      else
        render :new
      end
    end

    def update
      @emission = Emission.find(params[:emission_id])
      @episode = EmissionEpisode.find(params[:id])

      if @episode.update(emission_episode_params)
        redirect_to admin_emission_path(@emission), notice: t('admin.emission_episodes.updated_successfully')
      else
        render :edit
      end
    end

    def destroy
      @emission = Emission.find(params[:emission_id])
      @episode = EmissionEpisode.find(params[:id])

      if @episode.destroy
        redirect_to admin_emission_path(@emission), notice: t('admin.emission_episodes.deleted_successfully')
      else
        redirect_to admin_emission_path(@emission), error: t('admin.emission_episodes.deletion_error')
      end
    end

    private

    def emission_episode_params
      params.require(:emission_episode).permit(
        :titre,
        :published_at,
        :description,
        :emission_id,
        entrees_attributes: %i[id titre_piece temps_debut temps_fin vocal origine source _destroy]
      )
    end
  end
end
