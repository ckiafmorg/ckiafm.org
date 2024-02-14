# frozen_string_literal: true

class SessionsController < Admin::AdminController
  skip_before_action :authorize

  def new
    redirect_to admin_path if Current.user.signed_in?
  end

  def create
    user = User.authenticate_by({ email: params[:email], password: params[:password] })
    if user
      session[:user_id] = user.id
      redirect_to admin_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
