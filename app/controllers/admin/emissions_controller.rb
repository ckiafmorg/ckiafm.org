# frozen_string_literal: true

module Admin
  class EmissionsController < Admin::AdminController
    def index
      emissions = Emission.all.order(:status)

      render :index, locals: { emissions: emissions }
    end

    def show
      emission = Emission.find(params[:id])
      diffusion = Diffusion.new
      media = SocialMedium.new

      render :show, locals: { emission: emission, diffusion: diffusion, media: media }
    end

    def new
      emission = Emission.new
      media = SocialMedium.new
      # emission.social_medium << media

      render :new, locals: { emission: emission, media: media}
    end

    def create
      emission = Emission.new(emission_params)
      media = SocialMedium.new(social_media_params)
      emission.social_medium << media

      if emission.save
        redirect_to [:admin, emission], notice: t('admin.emissions.successfully_created')
      else
        render :new, locals: { emission: emission, media: media }
      end
    end

    private

    def emission_params
      params.require(:emission).permit(:nom, :description, :email, :status)
    end

    def social_media_params
      params.require(:social_medium).permit(:plateform, :url)
    end
  end
end
