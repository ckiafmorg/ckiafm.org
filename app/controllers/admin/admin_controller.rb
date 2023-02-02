# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authorize

    layout 'admin'

    def signed_in?
      Current.user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :signed_in?

    def authorize
      redirect_to new_session_path unless signed_in?
    end
  end
end
