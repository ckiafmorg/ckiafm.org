# frozen_string_literal: true

module Admin
  class MembresController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @membres = Membre.all
    end

    def new
      @membre = Membre.new(ville: 'Québec', province: 'Québec', pays: 'Canada')
      @memberships = Membership.all
    end

    def edit
      @membre = Membre.find(params[:id])
      @memberships = Membership.all
    end

    def create
      @membre = Membre.new(membre_params)
      if @membre.save
        redirect_to admin_membres_path, notice: t('admin.membres.successfully_created')
      else
        @memberships = Membership.all
        render :new
      end
    end

    def update
      @membre = Membre.find(params[:id])
      if @membre.update(membre_params)
        redirect_to admin_membres_path, notice: t('admin.membres.successfully_updated')
      else
        @memberships = Membership.all
        render :edit
      end
    end

    private

    def membre_params
      params.require(:membre).permit(
        :prenom,
        :nom,
        :email,
        :phone,
        :adresse,
        :code_postal,
        :ville,
        :province,
        :pays,
        :membership_id
      )
    end
  end
end
