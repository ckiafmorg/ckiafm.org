# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @user = User.all
    end

    def new
      @user = User.new
      @roles = User::ROLES
    end

    def edit
      @user = User.find(params[:id])
      @roles = User::ROLES
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])

      if @user.destroy
        redirect_to admin_users_path
      else
        render :index, error: t('admin.user.failed_to_destroy')
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :role)
    end
  end
end
