# frozen_string_literal: true

module Admin
  class PublicitesController < Admin::AdminController
    def index
      publicites = Publicite.all.order(:date_fin)

      render :index, locals: { publicites: publicites }
    end

    def new
      pub = Publicite.new

      render :new, locals: { pub: pub }
    end

    def edit
      pub = Publicite.find(params[:id])

      render :edit, locals: { pub: pub }
    end

    def create
      pub = Publicite.new(publicite_params)

      if pub.save
        redirect_to admin_publicites_path
      else
        render :new, locals: { pub: pub }
      end
    end

    def update
      pub = Publicite.find(params[:id])

      if pub.update(publicite_params)
        redirect_to admin_publicites_path
      else
        render :edit, locals: { pub: pub }
      end
    end

    def destroy
      pub = Publicite.find(params[:id])

      if pub.destroy
        redirect_to admin_publicites_path
      else
        error.add("La publicité n'a pas pu etre supprimé")
      end
    end

    private

    def publicite_params
      params.require(:publicite).permit(:nom, :liens, :date_debut, :date_fin, :format_id, :image)
    end
  end
end
