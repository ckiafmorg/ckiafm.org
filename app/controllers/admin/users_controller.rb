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

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: t('admin.users.created_successfully')
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :role, :password, :password_confirmation)
    end
  end
end
