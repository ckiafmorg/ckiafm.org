# frozen_string_literal: true

module Admin
  class CategorieEmissionsController < Admin::AdminController
    def index
      categorie = CategorieEmission.all

      render :index, locals: { categorie: categorie }
    end

    def new
      categorie = CategorieEmission.new

      render :new, locals: { categorie: categorie }
    end

    def edit
      categorie = CategorieEmission.find(params[:id])

      render :edit, locals: { categorie: categorie }
    end

    def create
      categorie = CategorieEmission.new(categorie_params)

      if categorie.save
        redirect_to admin_categorie_emissions_path
      else
        render :new, locals: { categorie: categorie }
      end
    end

    def update
      categorie = CategorieEmission.find(params[:id])

      if categorie.update(categorie_params)
        redirect_to admin_categorie_emissions_path
      else
        render :edit, locals: { categorie: categorie }
      end
    end

    def destroy
      categorie = CategorieEmission.find(params[:id])

      if categorie.destroy
        redirect_to admin_categorie_emissions_path
      else
        redirecr_to admin_categorie_emissions_path, alert: t('admin.categorie_emission.erruer.failed_to_destroy')
      end
    end

    private

    def categorie_params
      params.require(:categorie_emission).permit(:nom, :couleur)
    end
  end
end
