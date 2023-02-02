module Admin
  class SocialMediaController < Admin::AdminController
    def index
      media = SocialMedium.all

      render :index, locals: { media: media }
    end

    def new
      media = SocialMedium.new

      render :new, locals: { media: media }
    end

    def create
      media = SocialMedium.new(social_media_params)

      if media.save
        redirect_to new_admin_emission_path
      else
        render :new, locals: { media: media }
      end
    end

    private

    def social_media_params
      params.require(:social_medium).permit(:plateform, :url)
    end
  end
end

