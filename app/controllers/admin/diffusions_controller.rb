# frozen_string_literal: true

module Admin
  class DiffusionsController < AdminController
    def new
      emission = Emission.find(params[:emission_id])
      # TODO: there should really have a form object for that
      diffusion = Diffusion.new

      # TODO: faire un form object pour diffusion
      diffusion.rediffusion = true if emission.diffusions.count.positive?

      render :new, locals: { emission: emission, diffusion: diffusion }
    end

    def edit
      emission = Emission.find(params[:emission_id])
      diffusion = Diffusion.find(params[:id])

      render :edit, locals: { emission: emission, diffusion: diffusion }
    end

    def create
      emission = Emission.find(params.dig(:diffusion, :emission_id))
      type_diffusion = params.dig(:diffusion, :type_diffusion).to_sym
      diffusion = DiffusionFactory.create_for(type_diffusion, diffusion_params)
      emission.diffusions << diffusion

      if diffusion.save and emission.save
        redirect_to [:admin, emission], notice: t('admin.diffusion.successfully_created')
      else
        render :new, locals: { emission: emission, diffusion: diffusion }
      end
    end

    def update
      diffusion = Diffusion.find(params[:id])
      emission = Emission.find(params[:emission_id])
      if diffusion.update(diffusion_params)
        redirect_to [:admin, emission]
      else
        render :edit, locals: { emission: emission, diffusion: diffusion }
      end
    end

    def destroy
      diffusion = Diffusion.find(params[:id])
      emission = Emission.find(params[:emission_id])

      if diffusion.destroy
        redirect_to [:admin, emission], notice: t('admin.diffusion.successfully_deleted')
      else
        redirect_to [:admin, emission], error: t('admin.diffusion.failed_to_delete')
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
