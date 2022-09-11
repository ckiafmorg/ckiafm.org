# frozen_string_literal: true

module Admin
  class DiffusionsController < AdminController
    def new
      emission = Emission.find(params[:emission_id])
      diffusion = Diffusion.new

      render :new, locals: { emission: emission, diffusion: diffusion }
    end

    def create
      emission = Emission.find(params.dig(:diffusion, :emission_id))
      diffusion = emission.diffusions.build(diffusion_params)

      if diffusion.save! and emission.save!
        redirect_to [:admin, emission], notice: t('admin.diffusions.successfully_created')
      else
        render :new, locals: { emission: emission, diffusion: diffusion }
      end
    end

    private

    def diffusion_params
      params.require(:diffusion)
            .except(:emission_id)
            .permit(:temps_debut, :temps_fin, :date_debut, :diffuse_lundi,
                    :diffuse_mardi, :diffuse_mercredi, :diffuse_jeudi, :diffuse_vendredi,
                    :diffuse_vendredi, :diffuse_samedi, :diffuse_dimanche, :rediffusion)
    end
  end
end
