# frozen_string_literal: true

module Admin
  class MembresController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @membres = Membre.includes(:paiements)
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
      begin
        @membre.transaction do
          raise StandardError, 'Impossible de créer le paiement' unless @membre.save

          paiement = @membre.paiements.build(montant: @membre.membership.montant,
                                             date_fin_actif: Time.zone.today + 1.year)
          raise StandardError, 'Impossible de créer le paiement' unless paiement.save
        end
      rescue StandardError
        @memberships = Membership.all
        render :new
        return
      end

      redirect_to admin_membres_path, notice: t('admin.membres.created_successfully')
    end

    def update
      @membre = Membre.find(params[:id])
      if @membre.update(membre_params)
        redirect_to admin_membres_path, notice: t('admin.membres.updated_successfully')
      else
        @memberships = Membership.all
        render :edit
      end
    end

    def destroy
      membre = Membre.find(params[:id])
      if membre.destroy
        redirect_to admin_membres_path, notice: t('admin.membres.deleted_successfully')
      else
        redirect_to admin_membres_path, error: t('admin.membres.deletion_error')
      end
    end

    def renouvellement
      membre = Membre.find(params[:membre_id])

      if membre.paiements.create(montant: membre.membership.montant,
                                 date_fin_actif: membre.paiements.last.date_fin_actif + 1.year)

        redirect_to admin_membres_path, notice: t('admin.membres.renewed_successfully')
      else
        redirect_to admin_membres_path, error: t('admin.membres.failed_renew')
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
