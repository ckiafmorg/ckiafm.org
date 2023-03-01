# frozen_string_literal: true

module Admin
  class EmissionsController < Admin::AdminController
    def index
      @emissions = Emission.all.order(:status)
    end

    def show
      @emission = Emission.find(params[:id])
      @diffusion = Diffusion.new
    end

    def new
      @emission = Emission.new
      @utilisateurs = User.all
      @tags = Tag.all
    end

    def create
      @emission = Emission.new(emission_params)
      tag = Tag.find(params[:emission][:tags])
      @emission.tags << tag
      if @emission.save
        redirect_to [:admin, @emission], notice: t('admin.emissions.successfully_created')
      else
        render :new
      end
    end

    private

    def emission_params
      params.require(:emission).permit(:nom, :description, :email, :status, :categorie_emission_id, :utilisateurs_id,
                                       tags: [])
    end
  end
end
