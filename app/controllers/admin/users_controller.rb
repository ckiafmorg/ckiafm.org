# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: t('admin.users.successfully_created')
      else
        render :edit
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: t('admin.users.successfully_updated')
      else
        render :edit
      end
    end

    def destroy
      user = User.find(params[:id])
      if user.destroy
        redirect_to admin_users_path, notice: t('admin.users.successfully_deleted')
      else
        redirect_to admin_user_path, error: t('admin.users.deletion_error')
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :role, :password, :password_confirmation)
    end
  end
end
