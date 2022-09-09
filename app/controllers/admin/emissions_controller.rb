# frozen_string_literal: true

module Admin
  class EmissionsController < Admin::AdminController
    def index
      emissions = Emission.all

      render :index, locals: { emissions: emissions }
    end

    def show
      emission = Emission.find(params[:id])

      render :show, locals: { emission: emission }
    end

    def new
      emission = Emission.new

      render :new, locals: { emission: emission }
    end

    def create
      emission = Emission.new(emission_params)

      if emission.save
        redirect_to [:admin, emission], notive: t('admin.emissions.successfully_created')
      else
        render :new, locals: { emission: emission }
      end
    end

    private

    def emission_params
      params.require(:emission).permit(:nom, :description, :email, :status)
    end
  end
end
