# frozen_string_literal: true

module Admin
  class DiffusionsController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def new
      @emission = Emission.find(params[:emission_id])
      @diffusion = Diffusion.new
    end

    def edit
      @emission = Emission.find(params[:emission_id])
      @diffusion = Diffusion.find(params[:id])
    end

    def create
      @emission = Emission.find(params[:emission_id])
      @type_diffusion = params.dig(:diffusion, :type_diffusion).to_sym
      @diffusion = DiffusionFactory.create_for(@type_diffusion, diffusion_params)
      @emission.diffusions << @diffusion

      if @diffusion.save and @emission.save
        redirect_to [:admin, @emission], notice: t('admin.diffusions.successfully_created')
      else
        render :new
      end
    end

    def update
      @diffusion = Diffusion.find(params[:id])
      @emission = Emission.find(params[:emission_id])
      if @diffusion.update(diffusion_params)
        redirect_to [:admin, @emission]
      else
        render :new
      end
    end

    def destroy
      @diffusion = Diffusion.find(params[:id])
      @emission = Emission.find(params[:emission_id])

      if @diffusion.destroy
        redirect_to [:admin, @emission], notice: t('admin.diffusions.successfully_deleted')
      else
        redirect_to [:admin, @emission], error: t('admin.diffusions.failed_to_delete')
      end
    end

    private

    def diffusion_params
      params.require(:diffusion)
            .except(:type_diffusion)
            .permit(
              :temps_debut,
              :temps_fin,
              :date_debut,
              :diffuse_lundi,
              :diffuse_mardi,
              :diffuse_mercredi,
              :diffuse_jeudi,
              :diffuse_vendredi,
              :diffuse_vendredi,
              :diffuse_samedi,
              :diffuse_dimanche,
              :rediffusion
            )
    end
  end
end
