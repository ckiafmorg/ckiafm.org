# frozen_string_literal: true

module Admin
  class MembershipsController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @memberships = Membership.all
    end

    def new
      @membership = Membership.new
    end

    def edit
      @membershipo = Membership.find(params[:id])
    end

    def create
      @membership = Membership.new(memebership_params)
      if @membership.save
        redirect_to admin_memberships_path, notice: t('admin.memberships.successfully_created')
      else
        render :new
      end
    end

    def update
      @membership = Membership.find(params[:id])
      if @membership.update(memebership_params)
        redirect_to admin_memberships_path, notice: t('admin.memberships.successfully_updated')
      else
        render :edit
      end
    end

    private

    def memebership_params
      params.require(:membership).permit(:nom, :reccurence, :montant)
    end
  end
end
