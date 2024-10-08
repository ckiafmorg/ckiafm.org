# frozen_string_literal: true

module Admin
  class BaladosController < AdminController
    before_action except: %i[index show edit update] do
      ensure_user_is :admin
    end

    def index
      if Current.user.admin?
        @balados = Balado.all
      else
        @balados = Current.user.balados
      end
    end

    def show
      @balado = Balado.find(params[:id])
    end

    def new
      @balado = Balado.new
    end

    def edit
      @balado = Balado.find(params[:id])
    end

    def create
      @balado = Balado.new(balado_params)

      if @balado.save
        redirect_to admin_balados_path, notice: t('admin.balados.created_successfully')
      else
        render :new
      end
    end

    def update
      @balado = Balado.find(params[:id])

      if @balado.update(balado_params)
        redirect_to admin_balados_path, notice: t('admin.balados.updated_successfully')
      else
        render :edit
      end
    end

    def destroy
      balado = Balado.find(params[:id])

      if balado.destroy
        redirect_to admin_balados_path, notice: t('admin.articles.deleted_successfully')
      else
        redirect_to admin_balados_path, error: t('admin.articles.deletion_error')
      end
    end

    private

    def balado_params
      params.require(:balado).permit(
        :titre,
        :description,
        :published_at,
        :email,
        :website,
        :status,
        :user_id,
        tag_ids: []
      )
    end
  end
end
