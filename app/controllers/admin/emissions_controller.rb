# frozen_string_literal: true

module Admin
  class EmissionsController < Admin::AdminController
    def index
      @emissions = Emission.order(:status)
    end

    def show
      @emission = Emission.find(params[:id])
      @diffusion = Diffusion.new
    end

    def new
      @emission = Emission.new
      @emission.social_media_accounts.build
      @emission.membre_equipes.build
      @utilisateurs = User.all
      @tags = Tag.all
    end

    def edit
      @emission = Emission.find(params[:id])
      @emission.social_media_accounts.build
      @emission.membre_equipes.build
      @utilisateurs = User.all
      @tags = Tag.all
    end

    def create
      @emission = Emission.new(emission_params)
      if @emission.save
        redirect_to [:admin, @emission], notice: t('admin.emissions.successfully_created')
      else
        render :new
      end
    end

    def update
      @emission = Emission.find(params[:id])
      if @emission.update(emission_params)
        redirect_to [:admin, @emission], notice: t('admin.emissions.successfully_updated')
      else
        render :edit
      end
    end

    private

    def emission_params
      params.require(:emission).permit(
        :nom,
        :description,
        :email,
        :status,
        :categorie_emission_id,
        social_media_accounts_attributes: %i[id platform url nom _destroy],
        membre_equipes_attributes: %i[id nom role _destroy],
        user_ids: [],
        tag_ids: []
      )
    end
  end
end
